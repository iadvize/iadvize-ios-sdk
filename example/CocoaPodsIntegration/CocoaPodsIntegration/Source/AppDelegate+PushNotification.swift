//
//  AppDelegate+PushNotification.swift
//  CocoaPodsIntegration
//
//  Created by Alexandre Karst on 19/09/2018.
//  Copyright © 2018 iAdvize. All rights reserved.
//

import UIKit
import IAdvizeConversationSDK

extension AppDelegate {
    func pushNotificationsSetup() {
        /// Activate push notifications by registering user notifications settings.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let pushToken = AppDelegate.stringPushTokenFromData(deviceToken)

        // Register the Push Token to the iAdvize SDK.
        #if DEBUG
        IAdvizeSDK.shared.notificationController.registerPushToken(pushToken, applicationMode: ApplicationMode.dev)
        #else
        IAdvizeSDK.shared.notificationController.registerPushToken(pushToken, applicationMode: ApplicationMode.prod)
        #endif
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Error registering for push notifications: \(error.localizedDescription)")
    }

    /// Converts the device token from NSData to an hex String.
    ///
    /// - Parameter deviceToken: Device token data.
    /// - Returns: An hex String representing the push token.
    public static func stringPushTokenFromData(_ deviceToken: Data) -> String {
        let tokenChars = (deviceToken as NSData).bytes.bindMemory(to: CChar.self, capacity: deviceToken.count)
        var tokenString = ""

        for charCount in 0..<deviceToken.count {
            tokenString += String(format: "%02.2hhx", arguments: [tokenChars[charCount]])
        }

        return tokenString
    }
}
