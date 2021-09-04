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
                    ForEach(viewmodel.users) { user  in
                        NavigationLink(
                            destination: UserProfile( user: user),
                            label: {
                                ContactsCell(user: user);
                            }).foregroundColor(.black)
                    }
                }
            }
        }
    }

}
