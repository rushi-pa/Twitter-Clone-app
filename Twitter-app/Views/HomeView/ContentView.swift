//
//  ContentView.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-10.
//

import SwiftUI
import Kingfisher
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
                .navigationBarItems(leading: Button(action: {viewModel.SignOut()}, label: {
                    KFImage(URL(string: viewModel.user?.profileImageUrl ?? ""))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipped().cornerRadius(17)
                }))
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
