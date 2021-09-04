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
                    .frame(width: 50, height:50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(50/2)
                    
                VStack(alignment: .leading) {
                    HStack {
                        Text(tweet.fullname)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .opacity(0.9)
                        Text("@\(tweet.username)")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray);
                        Text("•")
                            .foregroundColor(.gray);
                        Text("tweet.timestamp")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray);
                        
                    };
                    
                    
                    Text(tweet.caption)
                            .font(.system(size: 20))
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            //.padding(.trailing);
                }
            }.padding(.leading,10)
            .padding(.trailing,9)
            .padding(.top)
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "heart")
                        .frame(width: 42, height: 42, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/);
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
            }.foregroundColor(.gray);
            
            Divider();
        };
    }
}

