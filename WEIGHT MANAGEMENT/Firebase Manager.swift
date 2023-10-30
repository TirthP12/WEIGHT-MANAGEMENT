import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class FirebaseManager: ObservableObject {
    private let ref = Database.database().reference()
    
    func push(_ value: String, under: String="") {
        ref.child("data/" + under).setValue(value)
    }
    
    func pull(under: String="") async -> String {
        let v = try? await ref.child("data/" + under).getData() //Todo fix error cases
        
        return v!.value as? String ?? "Unknown"
    }
    func pullRO(under: String="") async -> String {
        let v = try? await ref.child("under").getData() //Todo fix error cases
        
        return v!.value as? String ?? "Unknown"
    }
}
