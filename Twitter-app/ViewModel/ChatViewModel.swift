//
//  ChatViewModel.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-09-05.
//

import SwiftUI
import Firebase
struct ChatViewModel{
    let user : User
    init(user : User) {
        self.user = user
    }
    func fetchMessage(){}
    func sendMessage(_ messageText : String) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let cureentUserRef = COLLECTION_MESSAGES.document(uid).collection(user.id).document()
        let recivingUserRef = COLLECTION_MESSAGES.document(user.id).collection(uid)
        let reciveingRecentRef = COLLECTION_MESSAGES.document(user.id).collection("recent-messages")
        let currentRecentRef = COLLECTION_MESSAGES.document(uid).collection("recent-messages")
        let messageId = cureentUserRef.documentID
        let data = ["text" : messageText , "id" : messageId , "formId" : uid , "toId" : user.id, "timestamp" : Timestamp(date: Date())] as [String : Any]
        cureentUserRef.setData(data)
        recivingUserRef.document(messageId).setData(data);
        reciveingRecentRef.document(uid).setData(data);
        currentRecentRef.document(user.id).setData(data)
    }
}
