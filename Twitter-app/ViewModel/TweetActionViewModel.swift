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
    }
    func likeTweet(){
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return
        }
        COLLECTION_Tweet.document(tweet.id).updateData(["likes" : tweet.likes + 1]);
        COLLECTION_Tweet.document(tweet.id).collection("tweet-likes").document(currentUid).setData([:]) { _ in
            COLLECTION_Tweet.document(currentUid).collection("user-likes").document(self.tweet.id).setData([:]) { _ in
                self.didLike = true
            }
        }
    }
    func unlikeTweet(){
        
    }
}
