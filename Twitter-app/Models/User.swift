//
//  User.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-09-03.
//


import Firebase

struct User: Identifiable {
    let id: String
    let username: String
    let profileImageUrl: String
    let fullname: String
    let email: String
//    var stats: UserStats
//    var bio: String?
    
    var isFollowed = false
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id }
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uuid"] as? String ?? ""
        self.username = dictionary["userName"] as? String ?? ""
        self.profileImageUrl = dictionary["imageURL"] as? String ?? ""
        self.email = dictionary["Email"] as? String ?? ""
        self.fullname = dictionary["FullName"] as? String ?? ""
//        self.stats = UserStats(followers: 0, following: 0)
 //       self.bio = dictionary["bio"] as? String ?? ""
    }
}

//struct UserStats {
//    let followers: Int
//    let following: Int
//}
