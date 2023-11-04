

import Foundation

struct Contact: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var phoneNumber: String
    var email: String
}
