//
//  FeedView.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-11.
//

import SwiftUI

struct FeedView: View {
    @State var isnewTweetView : Bool
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView{
                VStack{
                    ForEach(0..<10) {_  in
                        Tweet_cell()
                    }
                }
            }
            Button(action: { isnewTweetView.toggle() }, label: {
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

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(isnewTweetView: false)
    }
}
