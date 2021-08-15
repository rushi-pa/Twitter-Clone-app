//
//  ContentView.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Log_inView();
//            TabView{
//                FeedView(isnewTweetView: false)
//                    .tabItem {
//                        Image(systemName: "house")
//                        Text("Home")
//                    }
//                SearchView()
//                    .tabItem {
//                        Image(systemName: "magnifyingglass")
//                        Text("Search")
//                    }
//                MessageView()
//                    .tabItem {
//                        Image(systemName: "envelope")
//                        Text("Messages")
//                    }
//            }
//            .navigationBarTitle("Home")
//            .navigationBarTitleDisplayMode(.inline);
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
