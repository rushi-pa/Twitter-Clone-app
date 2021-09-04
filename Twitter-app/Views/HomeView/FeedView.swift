//
//  FeedView.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-11.
//

import SwiftUI

struct FeedView: View {
    @State var isnewTweetView : Bool
    @ObservedObject var tweetViewMode = TweetViewModel()
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView{
                VStack{
                    ForEach(tweetViewMode.tweets
                    ) {tweet  in
                        Tweet_cell(tweet: tweet)
                    }
                }
            }
            Button(action: {
                //viewModel.SignOut()
                    isnewTweetView.toggle()
            }, label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .padding()
                    .opacity(0.8)
            })
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .padding()
            .fullScreenCover(isPresented: $isnewTweetView){
                newTweetView(isPresented: $isnewTweetView)
            }
        }
    }
}

