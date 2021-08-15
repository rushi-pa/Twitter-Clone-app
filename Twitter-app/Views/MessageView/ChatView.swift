//
//  ChatView.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-11.
//

import SwiftUI

struct ChatView: View {
    @State var messageText : String = ""
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 12){
                    ForEach(MOCK_MESSAGES) {message  in
                        ExtractedView(message: message)
                        }
                    }
            }.padding(.top)
            }
            Divider();
            MessageTextView(messageText: $messageText)
                .padding(.bottom,2)
        }
    }


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

