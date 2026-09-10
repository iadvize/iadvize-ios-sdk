import IAdvizeConversationSDK
import UIKit

/// Basic example showing how to setup the iAdvize SDK.
///
/// Replace the `projectId`, `targetingRuleId` and `userId` by appropriate values.
///
/// For more information, check our [Developer
/// Platform](https://docs.iadvize.dev/technologies/web-and-mobile-sdk/mobile-sdk).
final class AppDelegate: NSObject, UIApplicationDelegate {
    // TODO: Replace by your project Id (available in the iAdvize admin).
    let projectId: Int = 0

    // TODO: Replace by your targeting rule UUID (available in the iAdvize admin).
    let targetingRuleId: String = "your-targeting-rule-id"

    // TODO: Replace by a unique user Id.
    let userId: String = "your-user-unique-simple-identifier"

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        Task {
            do {
                try await setupIAdvize()
            } catch {
                print("Error: \(error)")
            }
        }
        return true
    }

    private func setupIAdvize() async throws {
        // Optional: customize the log level.
        IAdvizeSDK.shared.logLevel = .info

        // Optional: customize the Chatbox appearance and content.
        var chatboxConfiguration = ChatboxConfiguration()
        chatboxConfiguration.primaryColor = .chatboxPrimary
        chatboxConfiguration.secondaryColor = .chatboxSecondary
        chatboxConfiguration.title = "AI Copilot"
        chatboxConfiguration.automaticMessage = "Welcome to Smart Livechat! What can we do for you?"
        chatboxConfiguration.gdprMessage = "For a better support, we need to save the history of the exchanges and view your activity on the mobile app during the conversation."
        IAdvizeSDK.shared.chatboxController.setupChatbox(configuration: chatboxConfiguration)

        // Optional: configure a GDPR URL. You can also use the delegate option instead, or disable GDPR entirely.
        guard let url = URL(string: "https://your.legal.gdpr.url") else { return }
        let gdprOption = GDPROption.enabled(option: .legalInformation(url: url))

        // Mandatory: activate the iAdvize SDK.
        try await IAdvizeSDK.shared.activate(
            projectId: projectId,
            authenticationOption: .simple(userId: userId),
            gdprOption: gdprOption
        )

        // Optional: customize the targeting language. Uncomment to set it to French.
        // The targeting rule will only be triggered if the targeting language matches one of the respondent supported
        // languages.
        // By default, the targeting rule language uses the visitor’s device current language.
        // IAdvizeSDK.shared.targetingController.language = .custom(value: .fr)

        // Mandatory: activate the targeting rule.
        guard let id = UUID(uuidString: targetingRuleId) else { return }
        let targetingRule = TargetingRule(id: id)
        IAdvizeSDK.shared.targetingController.activateTargetingRule(targetingRule: targetingRule)

        // Optional: configure push notifications, to be notified of new messages.
        try await setupPushNotifications()
    }

    // MARK: - Push notifications

    private func setupPushNotifications() async throws {
        _ = try await UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])

        UIApplication.shared.registerForRemoteNotifications()
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let pushToken = AppDelegate.stringPushTokenFromData(deviceToken)

        #if DEBUG
        let applicationMode = ApplicationMode.dev
        #else
        let applicationMode = ApplicationMode.prod
        #endif

        // Register the device push token to the iAdvize SDK.
        IAdvizeSDK.shared.notificationController.registerPushToken(pushToken, applicationMode: applicationMode)
    }

    /// Convert the device push token data to string.
    private static func stringPushTokenFromData(_ deviceToken: Data) -> String {
        let tokenChars = (deviceToken as NSData).bytes.bindMemory(to: CChar.self, capacity: deviceToken.count)
        var tokenString = ""

        for charCount in 0..<deviceToken.count {
            tokenString += String(format: "%02.2hhx", arguments: [tokenChars[charCount]])
        }

        return tokenString
    }
}
