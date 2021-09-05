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
    @Published var userTweets = [Tweet]()
    @Published var userLikes = [Tweet]()
    init(user : User) {
        self.user = user
        checkIfUserIsFollowing()
        fetchUsersTweets()
        userLikedTweets()
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
    func fetchUsersTweets(){
        COLLECTION_Tweet.whereField("uid", isEqualTo: user.id).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            self.userTweets = documents.map({Tweet(dictionary: $0.data())})
        }
    }
    func userLikedTweets(){
        var tweets = [Tweet]()
        COLLECTION_USERS.document(user.id).collection("user-likes").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            let Tweetids = documents.map({$0.documentID});
            Tweetids.forEach { id in
                COLLECTION_Tweet.document(id).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else {return}
                    let tweet = Tweet(dictionary: data);
                    tweets.append(tweet)
                    guard tweets.count == Tweetids.count else {return}
                    self.userLikes = tweets
                }
            }
        }
    }
}
