//
//  SearchView.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-11.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = "";
    var body: some View {
        VStack{
            SearchBar(text: $searchText);
            ScrollView{
                VStack{
                    ForEach(0..<9) {_  in
                        NavigationLink(
                            destination: UserProfile(),
                            label: {
                                ContactsCell();
                            }).foregroundColor(.black)
                    }
                }
            }
        }
    }

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView();
        }
    }
}
