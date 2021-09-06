//
//  ProfileFollowView.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-14.
//

import SwiftUI

struct ProfileFollowView: View {
//    let isFollowing : Bool
    let viewmodel : ProfileViewModel
    @Binding var isFollowed : Bool
    var body: some View {
        if viewmodel.user.isCurrentUser {
            Button(action: {}, label: {
                Text("Edit Profile")
                    .frame(width: 360, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                
            })
            .cornerRadius(20)
        } else {
            HStack {
                Button(action: {
                    isFollowed ? viewmodel.unfollow() : viewmodel.follow()
                }, label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .frame(width: 180, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                    
                })
                .cornerRadius(20)
                
                NavigationLink(destination: ChatView(user: viewmodel.user), label: {
                    Text("Message")
                        .frame(width: 180, height: 40)
                        .background(Color.purple)
                        .foregroundColor(.white)
                })
                .cornerRadius(20)
            }
        }
    }
}
