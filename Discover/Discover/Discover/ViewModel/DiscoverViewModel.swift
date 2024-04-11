import Foundation
import PhotosUI
import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class DiscoverViewModel: ObservableObject {
    
    private let repo = Repository.sharedRepo
    @Published var showFilter = false
    private var manager = FireBaseManager.sharedFireBase
    private var listener: ListenerRegistration?
    @Published var selectedCountry = ""
    @Published var country = ["", "Deutschland", "Türkiye", "USA"]
    @Published var selectedCity = ""
    @Published var citiesOfGermany = ["Berlin", "Hamburg", "Frankfurt", "Stuttgart"]
    @Published var citiesOfTurkey = ["Ankara", "Istanbul", "Kars", "Ardahan"]
    @Published var citiesOfUSA = ["Washington", "New York", "Compton", "Miami"]
    @Published var categories = ["All", "Sport", "Dinner", "Fun", "Gaming"]
    @Published var selectedFisch = ""

    var mainList = [FirePost]()
    var searchInputDiscover = ""
    
    
    init(){
        loadListInRepo()
    }
    
    
    func loadListInRepo(){
        self.listener = manager.fireStore.collection("posts")
            .addSnapshotListener{ post, error in
                if let error = error {
                    print("Error reading pets: \(error)")
                    return
                }
                guard let documents = post?.documents else {
                    print("Query Snapshot is empty")
                    return
                }
                let firepost = documents.compactMap{ document in
                    try? document.data(as: FirePost.self)
                }
                self.mainList = firepost
                
            }
    }
    
    
    func like(bild: FirePost){
        //Hier muss über den angemeldeten User eine Datenbank erstellt werden, wo alle gelikedten bilder/videos gespeichert werden.
        //Zusätzlich, muss geprüft werden, ob das Bild bereits geliked ist. Falls ja, dann muss das Bild getogglet werden auf "filed.heart" andernfalls auf "heart"
    }
    
    
    
}
