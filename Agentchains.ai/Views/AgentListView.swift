import SwiftUI

struct AgentListView: View {
    @StateObject private var viewModel = AgentViewModel()
    @State private var showingAddAgent = false

    var body: some View {
        List {
            ForEach(viewModel.agents) { agent in
                AgentRow(agent: agent)
            }
            .onDelete { indexSet in
                Task {
                    for index in indexSet {
                        await viewModel.deleteAgent(viewModel.agents[index])
                    }
                }
            }
        }
        .navigationTitle("AI Agents")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showingAddAgent = true }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddAgent) {
            AddAgentView(viewModel: viewModel)
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .alert("Error", isPresented: .constant(viewModel.errorMessage != nil)) {
            Button("OK") {
                viewModel.errorMessage = nil
            }
        } message: {
            Text(viewModel.errorMessage ?? "")
        }
        .task {
            // Uncomment when Firebase is configured
            // await viewModel.loadAgents()
        }
    }
}

struct AgentRow: View {
    let agent: Agent

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(agent.name)
                    .font(.headline)

                Spacer()

                if agent.isActive {
                    Circle()
                        .fill(.green)
                        .frame(width: 8, height: 8)
                }
            }

            Text(agent.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)

            Text(agent.category)
                .font(.caption)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.blue.opacity(0.1))
                .foregroundColor(.blue)
                .cornerRadius(4)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    NavigationView {
        AgentListView()
    }
}
