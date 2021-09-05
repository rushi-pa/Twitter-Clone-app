//
//  UserProfileHeader.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-14.
//

import SwiftUI
import Kingfisher
struct UserProfileHeader: View {
    let viewmodel : ProfileViewModel
    @Binding var isFollowed : Bool
    var body: some View {
        VStack {
            KFImage(URL(string: viewmodel.user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(120 / 2)
                .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
            
            Text(viewmodel.user.fullname)
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            
            Text("@\(viewmodel.user.username)")
                .font(.subheadline)
                .font(.system(size: 1))
                .foregroundColor(.gray)
            
            Text(" User Bio Can be very Long and hefty so to allow reducing user to write extra studd that is not required in the bio as it is short and sweet I can allow user to only add upto 6 Lines or certain limit of characters so that the appplication does not crashes")
                .font(.system(size: 14))
                .padding(.top, 8)
                .padding(.horizontal)
            
            HStack(spacing: 40) {
                VStack {
                    Text("\(viewmodel.user.stats.followers)")
                        .font(.system(size: 16)).bold()
                    
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("\(viewmodel.user.stats.following)")
                        .font(.system(size: 16)).bold()
                    
                    Text("Following")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }.padding(.horizontal).padding(.top,9).padding(.bottom,9)
            
            ProfileFollowView(viewmodel: self.viewmodel, isFollowed: $isFollowed)
         //   ProfileActionButtonView(viewModel: viewModel, editProfilePresented: $editProfilePresented)
            Spacer()
        }
    }
}

//struct UserProfileHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileHeader()
//    }
//}
