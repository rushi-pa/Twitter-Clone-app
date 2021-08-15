//
//  MessageTextView.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-11.
//

import SwiftUI

struct MessageTextView: View {
    @Binding var messageText :String
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
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Send")
            })
        }.padding(.horizontal,9)
    }
}

struct MessageTextView_Previews: PreviewProvider {
    static var previews: some View {
        MessageTextView(messageText: .constant("Message..."))
    }
}
