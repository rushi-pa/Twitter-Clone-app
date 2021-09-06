//
//  SearchViewModel.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-09-03.
//

import SwiftUI
import Firebase
enum searchViewModelConfiguration {
    case search
    case message
}
class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    private var config : searchViewModelConfiguration
    init(config : searchViewModelConfiguration) {
        self.config = config
        fetchUsers(forConfig: config)
    }
    func fetchUsers(forConfig config : searchViewModelConfiguration){
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let users = documents.map({ User(dictionary: $0.data()) })
            switch config{
            case .message:  self.users = users.filter({!$0.isCurrentUser})
            case .search :  self.users = documents.map({ User(dictionary: $0.data()) })

            
            }
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
