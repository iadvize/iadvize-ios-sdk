import IAdvizeConversationSDK
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    let iAdvizeProjectID: Int = -1 // Replace with your project id
    let iAdvizeSimpleUserId: String = "your-user-unique-id" // Replace with your user id
    let iAdvizeTargetingRule = TargetingRule(
        id: UUID(uuidString: "your-targeting-rule-uuid") ?? UUID() // Replace with your targeting rule id
    )

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window?.makeKeyAndVisible()

        iAdvizeSetup()
        pushNotificationsSetup()

        return true
    }
}
