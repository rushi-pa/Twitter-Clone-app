//
//  newTweetView.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-14.
//

import SwiftUI

struct newTweetView: View {
    @Binding var isPresented : Bool
    @State var tweetInput : String = ""
  //  var tweet: Tweet?
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { isPresented.toggle() }, label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                })
                Spacer()
                
                Button(action: {}, label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                })
            }.padding()
            
//            if let tweet = tweet {
//                HStack {
//                    Text("Replying to")
//                        .foregroundColor(.gray)
//                    Text("@\(tweet.username)")
//                        .foregroundColor(.blue)
//
//                    Spacer()
//                }
//                .font(.system(size: 14))
//                .padding(.leading)
//            }
            
            HStack(alignment: .top) {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .cornerRadius(32)
                
                TextArea("What's happening", text: $tweetInput)
                
                Spacer()
            }.padding()
            Spacer()
        }
    }
}

struct newTweetView_Previews: PreviewProvider {
    static var previews: some View {
        newTweetView(isPresented: .constant(false))
    }
}
