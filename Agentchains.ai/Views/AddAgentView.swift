import SwiftUI

struct AddAgentView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: AgentViewModel

    @State private var name = ""
    @State private var description = ""
    @State private var selectedCategory = "Research"
    @State private var isActive = true

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Basic Information")) {
                    TextField("Agent Name", text: $name)
                    TextField("Description", text: $description, axis: .vertical)
                        .lineLimit(3...6)
                }

                Section(header: Text("Configuration")) {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Agent.categories, id: \.self) { category in
                            Text(category).tag(category)
                        }
                    }

                    Toggle("Active", isOn: $isActive)
                }
            }
            .navigationTitle("Add Agent")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        Task {
                            let agent = Agent(
                                name: name,
                                description: description,
                                category: selectedCategory,
                                isActive: isActive
                            )
                            await viewModel.addAgent(agent)
                            dismiss()
                        }
                    }
                    .disabled(name.isEmpty || description.isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddAgentView(viewModel: AgentViewModel())
}
