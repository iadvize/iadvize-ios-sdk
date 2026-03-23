import Foundation
import IAdvizeConversationSDK
import UIKit

extension AppDelegate {
    func iAdvizeSetup() {
        // Choose the log level of the SDK from `.verbose` to `.success`.
        IAdvizeSDK.shared.logLevel = .verbose

        customiseIAdvizeUI()

        iAdvizeActivate()
    }

    func customiseIAdvizeUI() {
        var configuration = ChatboxConfiguration()

        configuration.primaryColor = UIColor(red: 0.96, green: 0.49, blue: 0.38, alpha: 1.0)

        configuration.title = NSLocalizedString("Say Hello 👋", comment: "")

        configuration.avatar = UIImage(named: "AppIcon")

        configuration.automaticMessage = NSLocalizedString(
            "Any question? Say Hello to Smart and we will answer you as soon as possible! 😊",
            comment: ""
        )
        configuration.gdprMessage = NSLocalizedString(
            "As part of the GDPR, we have to ask you to consent to our legal information.",
            comment: ""
        )

        configuration.presentationStyle = .fullScreen

        IAdvizeSDK.shared.chatboxController.setupChatbox(configuration: configuration)
        IAdvizeSDK.shared.chatboxController.setFloatingButtonPosition(leftMargin: 15.0, bottomMargin: 15.0)
    }

    func iAdvizeActivate() {
        if let legalInfoURL = URL(string: "http://yourlegalinformationurl.com/legal") {
            let gdprOption: GDPROption = .enabled(option: .legalInformation(url: legalInfoURL))
            // Use this one for disabling GDPR : let gdprOption: GDPROption = .disabled

            IAdvizeSDK.shared.activate(
                projectId: iAdvizeProjectID,
                authenticationOption: .simple(userId: iAdvizeSimpleUserId),
                gdprOption: gdprOption
            ) { success in
                guard success else {
                    // Activation fails. You need to retry later to be able to properly activate the iAdvize
                    // Conversation SDK.
                    print("Activation failure.")
                    return
                }

                IAdvizeSDK.shared.targetingController.activateTargetingRule(targetingRule: self.iAdvizeTargetingRule)
            }
        }
    }
}
