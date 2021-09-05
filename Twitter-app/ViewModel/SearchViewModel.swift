//
//  SearchViewModel.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-09-03.
//

import SwiftUI
import Firebase
class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    func fetchUsers(){
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.map({ User(dictionary: $0.data()) })
//            documents.forEach { document in
//                let user = User(dictionary: document.data())
//                self.$users.append(user);
//            }
        }
    }
    func filterUser(_ query : String) -> [User]{
        let query1 = query.lowercased()
        return users.filter({$0.fullname.lowercased().contains(query1) || $0.username.contains(query1)})
    }
}
