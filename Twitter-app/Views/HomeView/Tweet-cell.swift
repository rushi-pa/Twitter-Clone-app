//
//  Tweet-cell.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-11.
//

import SwiftUI
import Kingfisher
struct Tweet_cell: View {
    let tweet : Tweet
    var body: some View {
        VStack{
            HStack(alignment: .top) {
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 48, height:48)
                    .cornerRadius(48/2)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(tweet.fullname)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                       
                        Text("@\(tweet.username)")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray);
                        Text("•")
                            .foregroundColor(.gray);
                        Text("2w")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray);
                        
                    };
                    
                    
                    Text(tweet.caption)
                        .font(.system(size: 20))
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                    //.padding(.trailing);
                }
            }.padding(.leading,-70)
            .padding(.trailing,9)
            .padding(.top)
            
            TweetActionView(tweet: tweet)
            Divider();
        }
    }
}

