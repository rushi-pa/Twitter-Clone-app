//
//  TweetActionViewModel.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-09-04.
//

import SwiftUI
import Firebase
class TweetActionViewModel:ObservableObject {
    let tweet : Tweet
    @Published var didLike = false
    init(tweet :Tweet) {
        self.tweet = tweet
        ifLiked();
    }
    func likeTweet(){
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        COLLECTION_Tweet.document(tweet.id).updateData(["likes" : tweet.likes + 1]);
        COLLECTION_Tweet.document(tweet.id).collection("tweet-likes").document(uid).setData([:]) { _ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(self.tweet.id).setData([:]) { _ in
                self.didLike = true
            }
        }
    }
    func unlikeTweet(){
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        COLLECTION_Tweet.document(tweet.id).updateData(["likes" : tweet.likes - 1]);
        COLLECTION_Tweet.document(tweet.id).collection("tweet-likes").document(uid).delete { _ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(self.tweet.id).delete { _ in
                self.didLike = false
            }
        }
    }
    func ifLiked(){
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return
        }
        COLLECTION_USERS.document(currentUid).collection("user-likes").document(tweet.id).getDocument { snapshot, _ in
            guard let didLike = snapshot?.exists else {return}
            self.didLike = didLike;
        }
    }
    
}
