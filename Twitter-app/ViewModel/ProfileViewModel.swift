//
//  ProfileViewModel.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-09-03.
//

import SwiftUI
import Firebase
class ProfileViewModel: ObservableObject {
    let user : User
    @Published var isFollowed = false
    
    init(user : User) {
        self.user = user
        checkIfUserIsFollowing()
    }
    
    func follow(){
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return
        }
        COLLECTION_Following.document(currentUid).collection("user-following").document(user.id).setData([:]) { _ in
            COLLECTION_Followers.document(self.user.id).collection("user-followers").document(currentUid).setData([:]) { _ in
                self.isFollowed = true;
            }
        }
    }
    
    func unfollow(){
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return
        }
        let userFollowing = COLLECTION_Following.document(currentUid).collection("user-following")
        let userFollowers = COLLECTION_Followers.document(self.user.id).collection("user-followers")
        
        userFollowing.document(user.id).delete { _ in
            userFollowers.document(currentUid).delete { _ in
                self.isFollowed = false;
            }
        }
    }
    
    func checkIfUserIsFollowing(){
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return
        }
        let userFollowing = COLLECTION_Following.document(currentUid).collection("user-following")
        userFollowing.document(user.id).getDocument { snapshot, _ in
            guard let isFollowed = snapshot?.exists else { return }
            self.isFollowed = isFollowed;
        }
    }
}
