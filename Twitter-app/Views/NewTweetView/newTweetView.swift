//
//  newTweetView.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-14.
//

import SwiftUI
import Kingfisher
struct newTweetView: View {
    @Binding var isPresented : Bool
    @ObservedObject var viewmodel : UploadTweetViewModel
    @State var tweetInput : String = ""
  //  var tweet: Tweet?
    init(isPresented : Binding<Bool>) {
        self._isPresented = isPresented
        self.viewmodel = UploadTweetViewModel(isPresented: isPresented)
    }
    var body: some View {
        VStack {
            HStack {
                Button(action: { isPresented.toggle() }, label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                })
                Spacer()
                
                Button(action: {viewmodel.UploadTweet(caption: tweetInput)}, label: {
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
                if let user = AuthViewModel.shared.user{
                    KFImage(URL(string: user.profileImageUrl )) //AuthViewModel.shared.user.))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .cornerRadius(32)
                }
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
