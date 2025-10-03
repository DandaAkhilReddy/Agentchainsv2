import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AgentListView()
                .tabItem {
                    Label("Agents", systemImage: "brain.head.profile")
                }

            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "chart.bar.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    NavigationView {
        ContentView()
    }
}
