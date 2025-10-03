import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var apiKey = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Account")) {
                    HStack {
                        Text("Email")
                        Spacer()
                        Text("user@example.com")
                            .foregroundColor(.secondary)
                    }

                    Button("Sign Out") {
                        // Handle sign out
                    }
                    .foregroundColor(.red)
                }

                Section(header: Text("Preferences")) {
                    Toggle("Push Notifications", isOn: $notificationsEnabled)
                    Toggle("Dark Mode", isOn: $darkModeEnabled)
                }

                Section(header: Text("API Configuration")) {
                    SecureField("API Key", text: $apiKey)

                    Button("Test Connection") {
                        // Test API connection
                    }
                }

                Section(header: Text("About")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.secondary)
                    }

                    Link("Privacy Policy", destination: URL(string: "https://agentchains.ai/privacy")!)
                    Link("Terms of Service", destination: URL(string: "https://agentchains.ai/terms")!)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
