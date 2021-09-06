//
//  ChatView.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-11.
//

import SwiftUI

struct ChatView: View {
    @State var messageText : String = ""
    let user : User
    let viewmodel : ChatViewModel
    init(user : User) {
        self.user = user
        self.viewmodel = ChatViewModel(user: user)
    }
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 12){
                    ForEach(MOCK_MESSAGES) {message  in
                        ExtractedView(message: message)
                        }
                    }
            }.padding(.top)
        }.navigationTitle(user.username)
            Divider();
        MessageTextView(messageText: $messageText, viewmodel: viewmodel)
                .padding(.bottom,2)
        }
    }


