

import SwiftUI

struct DiscoverDetailView: View {
    @EnvironmentObject private var discoverViewModel: DiscoverViewModel
    var bild: FirePost
    var body: some View {
        
        ScrollView{
            VStack{
                
                Text("TAG: \(bild.tag)")
                AsyncImage(
                    url: URL(string: bild.url),
                    content: { image in
                        image
                            .resizable().aspectRatio(contentMode: .fit)
                            .frame(width:.infinity).scaledToFill()
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                HStack{
                    VStack {
                        Image(systemName: "heart")
                        .onTapGesture {
                        }
                        Text("\(bild.likes)")
                    }
                    VStack {
                        Image(systemName: "text.bubble")
                        Text("Comments")
                    }
                    Spacer()
                    Image(systemName: "paperplane")
                    Image(systemName: "bookmark")
                    .padding(.trailing)
                }
                .padding(.top)
                .padding(.leading)
                
                Text("Beschreibung: \n\(bild.beschreibung)")
                .padding()
            }
        }//ScrollViewKlammer
        .environmentObject(discoverViewModel)
    }
}

#Preview{
    DiscoverDetailView(bild: FirePost(id: "1", url: "https://firebasestorage.googleapis.com:443/v0/b/discover-68f7d.appspot.com/o/05jGW7NRnHMig1Gpk6kFSLqa7es1%2FKlettern?alt=media&token=783b5a4d-1d99-4e99-9259-a3a274ef121d", tag: "jk", beschreibung: "Klettern", likes: 2, comments: ["fdhgysfgv"]))
        .environmentObject(DiscoverViewModel())
}
