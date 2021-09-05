//
//  TweetActionView.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-09-04.
//

import SwiftUI

struct TweetActionView: View {
    let tweet: Tweet
    @ObservedObject var viewModel: TweetActionViewModel
    init(tweet: Tweet) {
        self.tweet = tweet
        self.viewModel = TweetActionViewModel(tweet: tweet)
    }
    var body: some View {
        HStack{
            Button(action:  { viewModel.didLike ? viewModel.unlikeTweet() : viewModel.likeTweet()
            }, label: {
                Image(systemName: viewModel.didLike ? "heart.fill" : "heart")
                    .frame(width: 42, height: 42, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(viewModel.didLike ? .red : .gray);
            }).padding(.leading);
            Spacer();
            Button(action:{} , label: {
                Image(systemName: "bubble.left")
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/);
            });
            Spacer();
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "arrow.2.squarepath")
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/);
            });
            Spacer();
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "bookmark")
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/);
            }).padding(.trailing)
        }.foregroundColor(.gray);    }
}


