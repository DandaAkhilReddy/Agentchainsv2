import Foundation
import FirebaseFirestore

struct Agent: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var description: String
    var category: String
    var isActive: Bool
    var createdAt: Date
    var updatedAt: Date

    init(name: String, description: String, category: String, isActive: Bool = true) {
        self.name = name
        self.description = description
        self.category = category
        self.isActive = isActive
        self.createdAt = Date()
        self.updatedAt = Date()
    }
}

// Example categories
extension Agent {
    static let categories = ["Research", "Writing", "Data Analysis", "Customer Support", "Creative"]

    static let sampleAgents = [
        Agent(name: "Research Assistant", description: "Helps with web research and data gathering", category: "Research"),
        Agent(name: "Content Writer", description: "Creates engaging content and articles", category: "Writing"),
        Agent(name: "Data Analyzer", description: "Analyzes data and generates insights", category: "Data Analysis")
    ]
}
