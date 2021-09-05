//
//  UserProfile.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-14.
//

import SwiftUI

struct UserProfile: View {
    @State var filterSelected : TweetFilterOptions = .tweets
    let user : User
    @ObservedObject var viewmodel : ProfileViewModel

    init(user : User) {
        self.user = user
        self.viewmodel = ProfileViewModel(user: self.user)
    }
    var body: some View {
       
        ScrollView {
            LazyVStack {
                UserProfileHeader(viewmodel: self.viewmodel, isFollowed: $viewmodel.user.isFollowed).padding(.top,10)
            
        
       
        FilterButtonView(selectedOption: $filterSelected).padding()
        ForEach(viewmodel.tweet(forFilter: filterSelected)){tweet in
            Tweet_cell(tweet: tweet).padding(.leading)
        }
    }
        }
        //navigationTitle(user.username)
    }
}


