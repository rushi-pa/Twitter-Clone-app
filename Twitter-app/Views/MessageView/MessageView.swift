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
    var body: some View {
        ZStack (alignment: .bottomTrailing){
            NavigationLink(
                destination: ChatView(),
                isActive: $showChat,
                label: {})
            
                ScrollView{
                    VStack{
                        ForEach(0..<30) {_  in
                            NavigationLink(
                                destination: ChatView(),
                                label: {
                                    MessageCell().foregroundColor(.black);
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
                MessageSearchView(show: $isShown, StartnewChat: $showChat)
            })
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
