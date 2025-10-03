import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Stats Cards
                    HStack(spacing: 15) {
                        StatCard(title: "Active Agents", value: "3", color: .green)
                        StatCard(title: "Total Tasks", value: "12", color: .blue)
                    }

                    HStack(spacing: 15) {
                        StatCard(title: "Completed", value: "8", color: .orange)
                        StatCard(title: "In Progress", value: "4", color: .purple)
                    }

                    // Recent Activity
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Recent Activity")
                            .font(.headline)
                            .padding(.horizontal)

                        VStack(spacing: 10) {
                            ActivityRow(icon: "checkmark.circle.fill", color: .green, title: "Task completed", time: "2 min ago")
                            ActivityRow(icon: "play.circle.fill", color: .blue, title: "Agent started", time: "15 min ago")
                            ActivityRow(icon: "exclamationmark.triangle.fill", color: .orange, title: "Warning: Low credits", time: "1 hour ago")
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Dashboard")
        }
    }
}

struct StatCard: View {
    let title: String
    let value: String
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text(value)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(color)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

struct ActivityRow: View {
    let icon: String
    let color: Color
    let title: String
    let time: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(color)
                .frame(width: 24)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                Text(time)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
    }
}

#Preview {
    DashboardView()
}
