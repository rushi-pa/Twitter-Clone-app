//
//  MessageTextView.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-11.
//

import SwiftUI

struct MessageTextView: View {
    @Binding var messageText :String
    let  viewmodel : ChatViewModel
    
    var body: some View {
        HStack{
            TextField("message",text:$messageText)
                .padding(8)
                .padding(.horizontal)
                .background(Color(.systemGray6))
                .foregroundColor(.black)
                .opacity(0.6)
                .cornerRadius(10)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight:50);
            
            Button(action: {sendMessage()}, label: {
                Text("Send")
            })
        }.padding(.horizontal,9)
    }
    func sendMessage() {
        viewmodel.sendMessage(messageText)
        messageText = ""
    }
}

