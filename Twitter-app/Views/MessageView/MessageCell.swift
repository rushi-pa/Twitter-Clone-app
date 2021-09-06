//
//  MessageCell.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-11.
//

import SwiftUI
import Kingfisher
struct MessageCell: View {
    
    let message: Message
    var body: some View {
        VStack {
            HStack{
                KFImage(URL(string: message.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 38, height: 38, alignment: .leading)
                    .cornerRadius(19)
                    
                VStack(alignment: .leading) {
                    Text(message.user.fullname)
                        .font(.system(size: 19))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .opacity(0.7)
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        
                    Text(message.text)
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .lineLimit(2);
                    
                }.padding(.leading)
                Spacer();
            }.padding(.leading,6)
            .padding(9)
            
            Divider();
        }
        
    }
}
