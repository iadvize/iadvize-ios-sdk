import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Once the iAdvize SDK is activated, and if the targeting rule is successfully triggered, the chat button should appear in the bottom left corner. If not, check the logs and your config.")
            .multilineTextAlignment(.center)
    }
}

#Preview {
    ContentView()
}
