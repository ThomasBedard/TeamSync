import Foundation


struct Task: Identifiable {
    let id: UUID
    var name: String
    var deadline: Date
    var isComplete: Bool
}

