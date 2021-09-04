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
    @ObservedObject var viewmodel = SearchViewModel()
    var body: some View {
        VStack{
        SearchBar(text: $searchText);
        ScrollView{
            VStack{
                ForEach(viewmodel.users) { user  in
                    Button(action: {self.show.toggle()
                            self.StartnewChat.toggle()}, label: {
                                ContactsCell(user: user)
                            }).foregroundColor(.black )
                }
            }
        }
    }
    }
}

struct MessageSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MessageSearchView(show: .constant(true), StartnewChat: .constant(true))
    }
}
