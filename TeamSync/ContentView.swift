
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NewsfeedView()
                .tabItem {
                    VStack {
                        Image("News")
                            .renderingMode(.template)
                        Text("Newsfeed")
                    }
                }
            TasksView()
                .tabItem {
                    VStack {
                        Image("Task")
                            .renderingMode(.template)
                        Text("Tasks")
                    }
                }
            
            DirectoryView()
                .tabItem {
                    VStack {
                        Image("Directory")
                            .renderingMode(.template)
                        Text("Directory")
                    }
                }
            
            AboutUsView()
                .tabItem {
                    VStack {
                        Image("AboutUs")
                            .renderingMode(.template)
                        Text("About Us")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

