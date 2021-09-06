//
//  MessageViewUtil.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-11.
//

import SwiftUI
import Kingfisher
struct ExtractedView: View {
    let message : Message
    
    var body: some View {
        HStack {
            if message.isFromCurrentUser {
                Spacer();
                Text(message.text)
                    .padding()
                    .background(Color.blue)
                    .clipShape(ChatBubble(isFromCurrentUser: true))
            }else{
                HStack{
                    KFImage(URL(string: message.user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40 , height : 40)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/);
                    Text(message.text).padding()
                        .background(Color.yellow)
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                    
                    Spacer();
                }
            }
        }.padding(7)
    }
}
