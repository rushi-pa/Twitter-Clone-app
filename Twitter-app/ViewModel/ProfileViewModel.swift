//
//  ProfileViewModel.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-09-03.
//

import SwiftUI
import Firebase
class ProfileViewModel: ObservableObject {
    @Published var user : User
    @Published var userTweets = [Tweet]()
    @Published var userLikes = [Tweet]()
    init(user : User) {
        self.user = user
        checkIfUserIsFollowing()
        fetchUsersTweets()
        userLikedTweets()
        fetchUserStats()
    }
    
}

//MARK : API funcs

extension ProfileViewModel{    func follow(){
    guard let currentUid = Auth.auth().currentUser?.uid else {
        return
    }
    COLLECTION_Following.document(currentUid).collection("user-following").document(user.id).setData([:]) { _ in
        COLLECTION_Followers.document(self.user.id).collection("user-followers").document(currentUid).setData([:]) { _ in
            self.user.isFollowed = true;
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
            self.user.isFollowed = false;
        }
    }
}

func checkIfUserIsFollowing(){
    guard let currentUid = Auth.auth().currentUser?.uid else {
        return
    }
    guard !user.isCurrentUser else {return}
    let userFollowing = COLLECTION_Following.document(currentUid).collection("user-following")
    userFollowing.document(user.id).getDocument { snapshot, _ in
        guard let isFollowed = snapshot?.exists else { return }
        self.user.isFollowed = isFollowed;
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
func tweet(forFilter filter : TweetFilterOptions) -> [Tweet]{
    switch filter{
    case .tweets:
        return userTweets
    case .replies:
        return [Tweet]()
    case .likes:
        return userLikes
    }
}
func fetchUserStats(){
    let followRef = COLLECTION_Followers.document(user.id).collection("user-followers")
    let followingRef = COLLECTION_Following.document(user.id).collection("user-following")
    followRef.getDocuments { snapshot, _ in
        guard let followersCount = snapshot?.documents.count else {return}
        followingRef.getDocuments { snapshot, _ in
            guard let followingCount = snapshot?.documents.count else {return}
            self.user.stats = UserStats(followers: followersCount, following: followingCount);
            
        }
    }
}
}
