import Foundation
import FirebaseFirestore
import FirebaseAuth

class FirebaseService: ObservableObject {
    static let shared = FirebaseService()

    private let db = Firestore.firestore()
    private let auth = Auth.auth()

    @Published var currentUser: User?

    private init() {
        // Listen to auth state changes
        auth.addStateDidChangeListener { [weak self] _, user in
            self?.currentUser = user
        }
    }

    // MARK: - Authentication

    func signUp(email: String, password: String) async throws -> User {
        let result = try await auth.createUser(withEmail: email, password: password)
        return result.user
    }

    func signIn(email: String, password: String) async throws -> User {
        let result = try await auth.signIn(withEmail: email, password: password)
        return result.user
    }

    func signOut() throws {
        try auth.signOut()
    }

    // MARK: - Firestore Operations

    func saveDocument<T: Encodable>(collection: String, documentId: String? = nil, data: T) async throws {
        let docRef = documentId != nil
            ? db.collection(collection).document(documentId!)
            : db.collection(collection).document()

        try docRef.setData(from: data)
    }

    func fetchDocument<T: Decodable>(collection: String, documentId: String, as type: T.Type) async throws -> T {
        let snapshot = try await db.collection(collection).document(documentId).getDocument()
        return try snapshot.data(as: type)
    }

    func fetchCollection<T: Decodable>(collection: String, as type: T.Type) async throws -> [T] {
        let snapshot = try await db.collection(collection).getDocuments()
        return try snapshot.documents.compactMap { try $0.data(as: type) }
    }

    func deleteDocument(collection: String, documentId: String) async throws {
        try await db.collection(collection).document(documentId).delete()
    }
}
