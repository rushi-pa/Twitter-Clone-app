//
//  UploadTweetViewModel.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-09-04.
//

import SwiftUI
import Firebase
class UploadTweetViewModel: ObservableObject {
    @Binding var isPresented: Bool
    init(isPresented : Binding<Bool>) {
        self._isPresented = isPresented
    }
    func UploadTweet(caption : String){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            guard let user = AuthViewModel.shared.user else { return };
            let docRef = COLLECTION_Tweet.document()
            let data : [String : Any] = ["uid" : user.id,
                                         "id" : docRef.documentID,
                                         "caption" : caption,
                                         "fullname" : user.fullname,
                                         "timeStamp" : Timestamp(date: Date()),
                                         "username" : user.username,
                                         "profileImageUrl" : user.profileImageUrl,
                                         "Likes" : 0,  ]
            docRef.setData(data)
            self.isPresented = false
        }
    }
}
