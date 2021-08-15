//
//  MessageViewUtil.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-11.
//

import SwiftUI

struct ExtractedView: View {
    let message : MockMessage
    var body: some View {
        HStack {
            if message.isCurrentUser {
                Spacer();
                Text(message.messageText)
                    .padding()
                    .background(Color.blue)
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                
                
            }else{
                HStack{
                    Image(message.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40 , height : 40)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/);
                    Text(message.messageText).padding()
                        .background(Color.yellow)
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                    
                    Spacer();
                }
            }
        }.padding(7)
    }
}

