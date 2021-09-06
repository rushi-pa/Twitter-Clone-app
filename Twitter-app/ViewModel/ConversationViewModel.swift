//
//  ConversationViewModel.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-09-05.
//

import SwiftUI
import Firebase
class ConversationViewModel: ObservableObject{
    @Published var recentMessage = [Message]()
    private var recentMessageDictionary = [String : Message]()
    init() {
        fetchRecentMessages()
    }
    func fetchRecentMessages(){
        guard let uid =  AuthViewModel.shared.userSession?.uid else {return}
        let query = COLLECTION_MESSAGES.document(uid).collection("recent-messages")
        query.order(by: "timestamp", descending: true)
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges else {return}
            changes.forEach { change in
                let messageData = change.document.data()
                let uid = change.document.documentID
                COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    let user = User(dictionary: data)
                    self.recentMessageDictionary[uid] = Message(user: user, dictionary: messageData)
                    self.recentMessage = Array(self.recentMessageDictionary.values)
                }
            }
        }
    }
}


