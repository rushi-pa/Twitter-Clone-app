//
//  MessageView.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-11.
//

import SwiftUI

struct MessageView: View {
    @State var isShown = false;
    @State var showChat = false;
    @State var user : User?
    @ObservedObject var viewmodel = ConversationViewModel()
    var body: some View {
        ZStack (alignment: .bottomTrailing){
            if let user = user {
            NavigationLink(
                destination: ChatView(user: user),
                isActive: $showChat,
                label: {})
                
            }
            
                ScrollView{
                    VStack{
                        ForEach(viewmodel.recentMessage) {message  in
                            NavigationLink(
                                destination: ChatView(user: message.user),
                                label: {
                                    MessageCell(message: message).foregroundColor(.black);
                                })
                        }
                    }
            }
            Button(action: {self.isShown.toggle()}, label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 26)
                    .padding()
                    .opacity(0.8)
            })
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .padding()
            .sheet(isPresented: $isShown, content: {
                MessageSearchView(show: $isShown, StartnewChat: $showChat, user: $user)
            })
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
