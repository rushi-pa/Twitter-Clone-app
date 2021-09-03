//
//  ContentView.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-10.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var selectedIndex = 0
    @State private var showingMenu = false
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                NavigationView{
                TabView{
                    FeedView(isnewTweetView: false)
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                    MessageView()
                        .tabItem {
                            Image(systemName: "envelope")
                            Text("Messages")
                        }
                }
                .navigationBarTitle("Home")
                .navigationBarTitleDisplayMode(.inline);
                }
            }else{
                Log_inView();

            }
        }
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
