//
//  MessageSearchView.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-11.
//

import SwiftUI

struct MessageSearchView: View {
    
    @State var searchText = "";
    @Binding var show : Bool
    @Binding var StartnewChat : Bool
    @Binding var user : User?
    @ObservedObject var viewmodel = SearchViewModel(config: .message)
    var body: some View {
        VStack{
        SearchBar(text: $searchText);
        ScrollView{
            VStack{
                ForEach(searchText.isEmpty ? viewmodel.users : viewmodel.filterUser(searchText)) { user  in
                    Button(action: {self.show.toggle()
                            self.StartnewChat.toggle()
                        self.user = user
                    }, label: {
                                ContactsCell(user: user)
                            }).foregroundColor(.black )
                }
            }
        }
    }
    }
}
