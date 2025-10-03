import Foundation
import SwiftUI

@MainActor
class AgentViewModel: ObservableObject {
    @Published var agents: [Agent] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let firebaseService = FirebaseService.shared

    init() {
        // Load sample data for now
        loadSampleData()
    }

    func loadSampleData() {
        agents = Agent.sampleAgents
    }

    func loadAgents() async {
        isLoading = true
        errorMessage = nil

        do {
            agents = try await firebaseService.fetchCollection(collection: "agents", as: Agent.self)
        } catch {
            errorMessage = "Failed to load agents: \(error.localizedDescription)"
            // Fall back to sample data
            loadSampleData()
        }

        isLoading = false
    }

    func addAgent(_ agent: Agent) async {
        do {
            try await firebaseService.saveDocument(collection: "agents", data: agent)
            await loadAgents()
        } catch {
            errorMessage = "Failed to add agent: \(error.localizedDescription)"
        }
    }

    func deleteAgent(_ agent: Agent) async {
        guard let id = agent.id else { return }

        do {
            try await firebaseService.deleteDocument(collection: "agents", documentId: id)
            await loadAgents()
        } catch {
            errorMessage = "Failed to delete agent: \(error.localizedDescription)"
        }
    }
}
