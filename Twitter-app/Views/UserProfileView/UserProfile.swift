//
//  UserProfile.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-14.
//

import SwiftUI

struct UserProfile: View {
    @State var filterSelected : TweetFilterOptions = .tweets
    var body: some View {
       
        UserProfileHeader();
       // navigationTitle("Batman")
        FilterButtonView(selectedOption: $filterSelected).padding()
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
