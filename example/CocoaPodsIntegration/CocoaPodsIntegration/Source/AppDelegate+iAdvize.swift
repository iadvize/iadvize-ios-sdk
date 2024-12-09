//
//  AppDelegate+iAdvize.swift
//  CocoaPodsIntegration
//
//  Created by Alexandre Karst on 19/09/2018.
//  Copyright © 2018 iAdvize. All rights reserved.
//

import Foundation
import IAdvizeConversationSDK

extension AppDelegate {
    func iAdvizeSetup() {
        // Choose the log level of the SDK from `.verbose` to `.success`.
        IAdvizeSDK.shared.logLevel = .verbose

        customiseIAdvizeUI()

        // By default, the iAdvize Conversation SDK take the device language
        IAdvizeSDK.shared.targetingController.language = SDKLanguageOption.custom(value: .en)

        iAdvizeActivate()
    }

    func customiseIAdvizeUI() {
        var configuration = ChatboxConfiguration()

        let mainColor = UIColor(red: 0.96, green: 0.49, blue: 0.38, alpha: 1.0)

        configuration.accentColor = mainColor
        configuration.outgoingMessageBackgroundColor = mainColor

        configuration.navigationBarBackgroundColor = mainColor
        configuration.navigationBarMainColor = .white
        configuration.navigationBarTitle = NSLocalizedString("Say Hello 👋", comment: "")

        if let image = UIImage(named: "AppIcon") {
            configuration.incomingMessageAvatar = IncomingMessageAvatar.image(image: image)
        }
        configuration.automaticMessage = NSLocalizedString("Any question? Say Hello to Smart and we will answer you as soon as possible! 😊", comment: "")
        configuration.gdprMessage = NSLocalizedString("As part of the GDPR, we have to ask you to consent to our legal information.", comment: "")

        configuration.presentationStyle = .fullScreen

        IAdvizeSDK.shared.chatboxController.setupChatbox(configuration: configuration)
        IAdvizeSDK.shared.chatboxController.setFloatingButtonPosition(leftMargin: 15.0, bottomMargin: 15.0)
    }

    func iAdvizeActivate() {
        if let legalInfoURL = URL(string: "http://yourlegalinformationurl.com/legal") {
            let gdprOption: GDPROption = .enabled(option: .legalInformation(url: legalInfoURL))
            // Use this one for disabling GDPR : let gdprOption: GDPROption = .disabled

            IAdvizeSDK.shared.activate(projectId: iAdvizeProjectID,
                                       authenticationOption: .simple(userId: iAdvizeSimpleUserId),
                                       gdprOption: gdprOption) { success in
                guard success else {
                    // Activation fails. You need to retry later to be able to properly activate the iAdvize Conversation SDK.
                    print("Activation failure.")
                    return
                }

                IAdvizeSDK.shared.targetingController.activateTargetingRule(targetingRule: self.iAdvizeTargetingRule)
            }
        }
    }
}
