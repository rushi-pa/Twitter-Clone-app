//
//  SearchView.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-11.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = "";
    @ObservedObject var viewmodel = SearchViewModel()
    var body: some View {
        VStack{
            SearchBar(text: $searchText);
            ScrollView{
                VStack{
                    ForEach(searchText.isEmpty ? viewmodel.users : viewmodel.filterUser(searchText)) { user  in
                        NavigationLink(
                            destination: LazyView(UserProfile( user: user)),
                            label: {
                                ContactsCell(user: user);
                            })
                            .navigationTitle(user.username)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }

}
