import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "link.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)

            Text("Agentchains.ai")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("AI Agent Workflow Platform")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("Home")
    }
}

#Preview {
    NavigationView {
        ContentView()
    }
}
