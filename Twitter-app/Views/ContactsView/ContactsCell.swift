//
//  ContactsCell.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-11.
//

import SwiftUI

struct ContactsCell: View {
    var body: some View {
        VStack {
            HStack{
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 38, height: 38, alignment: .leading)
                    .cornerRadius(19)
                    
                VStack(alignment: .leading) {
                    Text("Contact Name")
                        .font(.system(size: 19))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .opacity(0.7)
                        
                    Text("info")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                    
                }.padding(.leading)
                Spacer();
            }.padding(.leading,6)
            .padding(9)
            
            Divider();
        }
        
    }
}

struct ContactsCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactsCell()
    }
}
