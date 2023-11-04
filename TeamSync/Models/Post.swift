import Foundation

struct Post: Identifiable {
    let id = UUID()
    let author: String
    let content: String
    let imageName: String
    let postedAt: Date
    var likes: Int
}
