import SwiftUI

struct AboutUsView : View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20){
                
                Image(systemName: "person.3.sequence")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding(.top, 40)

                Text("TeamSync")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.blue)

                
                Text("Our Mission")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.secondary)
                    .padding(.top, 5)

               
                Text("Provide businesses with a management tool that focuses on efficiency and usefulness, TeamSync empowers teams to collaborate effectively and maintain peak productivity.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()

                
                Button(action: {
                    
                }) {
                    Text("Learn More About Us")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                
                VStack {
                    Text("Contact Us")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    
                    Text("support@teamsync.com")
                        .foregroundColor(.secondary)
                    
                }
                .padding(.bottom, 20)
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
        .edgesIgnoringSafeArea(.all)
    }
}
