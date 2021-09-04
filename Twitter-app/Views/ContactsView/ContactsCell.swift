//
//  ContactsCell.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-11.
//

import SwiftUI
import Kingfisher
struct ContactsCell: View {
    let user : User
    var body: some View {
        VStack {
            HStack{
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 38, height: 38, alignment: .leading)
                    .cornerRadius(19)
                    
                VStack(alignment: .leading) {
                    Text(user.username)
                        .font(.system(size: 19))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .opacity(0.7)
                        
                    Text(user.fullname)
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                    
                }.padding(.leading)
                Spacer();
            }.padding(.leading,6)
            .padding(9)
            
            Divider();
        }
        
    }
}

