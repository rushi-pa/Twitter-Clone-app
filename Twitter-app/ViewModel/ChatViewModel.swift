//
//  ChatViewModel.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-09-05.
//

import SwiftUI
import Firebase
class ChatViewModel : ObservableObject{
    let user : User
    @Published var messages = [Message]()
    init(user : User) {
        self.user = user
        fetchMessage()
        print(self.messages)
    }
    func fetchMessage(){
        guard let uid =  AuthViewModel.shared.userSession?.uid else {return}
        
        let query = COLLECTION_MESSAGES.document(uid).collection(user.id)
        query.order(by: "timestamp", descending: true)
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({$0.type == .added}) else {return}
            
            print(self.messages)
            changes.forEach { change in
                let messageData = change.document.data()
                print(messageData)
                guard let fromId = messageData["fromId"] as? String else {return}
                
                print(self.messages)
                COLLECTION_USERS.document(fromId).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    let user = User(dictionary: data)
                    self.messages.append(Message(user: user, dictionary: messageData))
                    
                    print(self.messages)
                }
            }
        }
    }
    
    func sendMessage(_ messageText : String) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let cureentUserRef = COLLECTION_MESSAGES.document(uid).collection(user.id).document()
        let recivingUserRef = COLLECTION_MESSAGES.document(user.id).collection(uid)
        let reciveingRecentRef = COLLECTION_MESSAGES.document(user.id).collection("recent-messages")
        let currentRecentRef = COLLECTION_MESSAGES.document(uid).collection("recent-messages")
        let messageId = cureentUserRef.documentID
        let data = ["text" : messageText , "id" : messageId , "fromId" : uid , "toId" : user.id, "timestamp" : Timestamp(date: Date())] as [String : Any]
        cureentUserRef.setData(data)
        recivingUserRef.document(messageId).setData(data);
        reciveingRecentRef.document(uid).setData(data);
        currentRecentRef.document(user.id).setData(data)
        
    }
}
