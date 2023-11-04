

import SwiftUI


struct NewsfeedPostView: View {
    let post: Post
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading) {
                    Text(post.author).fontWeight(.bold)
                    Text(post.postedAt, style: .time)
                }
            }
            Text(post.content)
            Image(post.imageName)
                .resizable()
                .scaledToFit()
            //NOT YET IMPLEMENTED
            // Like and Comment buttons
            HStack {
                Button(action: {
                    // Handle like action
                }) {
                    Label("Like", systemImage: "heart")
                }
                Button(action: {
                    // Handle comment action
                }) {
                    Label("Comment", systemImage: "bubble.right")
                }
                Spacer()
                Button(action: {
                    // Handle share action
                }) {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding()
    }
}

struct NewsfeedView: View {
    @StateObject var viewModel = NewsfeedViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                NewsfeedPostView(post: post)
            }
            .navigationTitle("Newsfeed")
            .toolbar {
                // compose button here
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Handle new post action
                    }) {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
    }
}
