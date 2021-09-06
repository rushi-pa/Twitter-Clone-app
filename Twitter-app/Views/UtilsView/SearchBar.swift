//
//  SearchBar.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-11.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    var body: some View {
        HStack{
            TextField("Search",text : $text)
                .padding(8)
                .padding(.horizontal,24)
                .background(Color(.systemGray6))
                .foregroundColor(.black)
                .cornerRadius(10)
                .overlay(HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: .infinity, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding(.leading,8)
                    
                })
                
        }.padding(.horizontal,20).padding(.vertical,10)
    }
    }
