//
//  ProfileFollowView.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-14.
//

import SwiftUI

struct ProfileFollowView: View {
    let isCurrentUser : Bool
    let isFollowing : Bool
    var body: some View {
        if isCurrentUser {
            Button(action: {}, label: {
                Text("Edit Profile")
                    .frame(width: 360, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                
            })
            .cornerRadius(20)
        } else {
            HStack {
                Button(action: {}, label: {
                    Text(isFollowing ? "Following" : "Follow")
                        .frame(width: 180, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                    
                })
                .cornerRadius(20)
                
                NavigationLink(destination: ChatView(), label: {
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

struct ProfileFollowView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileFollowView(isCurrentUser: true, isFollowing: true)
    }
}
