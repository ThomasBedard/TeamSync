import SwiftUI


class NewsfeedViewModel: ObservableObject {
    
    @Published var posts: [Post] = [
        Post(author: "Jane Doe", content: "IMPORTANT: TeamSync Update ! You can now DELETE by SLIDING left with your finger or mouse on a task or contact. You can also EDIT in both TASK and DIRECTORY. Hold your click on a task to modify it. For Contact, simply click on them to modify the details.", imageName: "post_image_1", postedAt: Date(), likes: 5),
        
    ]
    
    
    
    
}
