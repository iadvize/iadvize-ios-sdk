//
//  AppDelegate+iAdvize.swift
//  IAdvizeSwiftExample
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

        // Switch to false to test without GDPR.
        let shouldActivateGDPR = true

        // By default, the iAdvize Conversation SDK take the device language
        IAdvizeSDK.shared.targetingController.language = SDKLanguageOption.custom(value: .en)

        if shouldActivateGDPR {
            iAdvizeActivateWithGDPR()

        } else {
            iAdvizeActivate()
        }
    }

    func customiseIAdvizeUI() {
        var configuration = ChatboxConfiguration()

        let mainColor = UIColor(red: 0.96, green: 0.49, blue: 0.38, alpha: 1.0)

        configuration.mainColor = mainColor
        configuration.navigationBarBackgroundColor = mainColor
        configuration.navigationBarMainColor = .white
        configuration.navigationBarTitle = NSLocalizedString("Say Hello 👋", comment: "")
        configuration.font = UIFont(name: "HelveticaNeue", size: 11.0)!
        configuration.automaticMessage = NSLocalizedString("Any question? Say Hello to Smart and we will answer you as soon as possible! 😊", comment: "")
        configuration.gdprMessage = NSLocalizedString("As part of the GDPR, we have to ask you to consent to our legal information.", comment: "")
        // Update avatar for the incoming messages
        if let image = UIImage(named: "AppIcon") {
            configuration.incomingMessageAvatar = IncomingMessageAvatar.image(image: image)
        }

        configuration.presentationStyle = .fullScreen

        IAdvizeSDK.shared.chatboxController.setupChatbox(configuration: configuration)

        IAdvizeSDK.shared.chatboxController.setFloatingButtonPosition(leftMargin: 15.0, bottomMargin: 15.0)
    }

    func iAdvizeActivate() {
        // Replace "ConnectedUserIdentifier" by your user unique identifier (it should not be
        // a personal information of your user) so they can retrieve their conversation history
        // accross installations and devices.
        IAdvizeSDK.shared.activate(projectId: iAdvizeProjectID,
                                   authenticationOption: .simple(userId: "UserIdentifier")) { success in
            guard success else {
                // Activation fails. You need to retry later to be able to properly activate the iAdvize Conversation SDK.
                print("Activation failure.")
                return
            }

            IAdvizeSDK.shared.targetingController.activateTargetingRule(targetingRule: self.iAdvizeTargetingRule)
        }
    }

    func iAdvizeActivateWithGDPR() {
        // To activate GDPR, you have to provide a legal information URL.
        if let legalInfoURL = URL(string: "http://yourlegalinformationurl.com/legal") {
            IAdvizeSDK.shared.activate(projectId: iAdvizeProjectID,
                                       authenticationOption: .simple(userId: YOUR_USER_ID),
                                       gdprOption: .enabled(option: .legalInformation(url: legalInfoURL))) { success in
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
