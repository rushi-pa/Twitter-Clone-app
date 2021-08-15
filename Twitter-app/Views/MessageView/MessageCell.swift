//
//  MessageCell.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-11.
//

import SwiftUI

struct MessageCell: View {
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
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        
                    Text("Suppose this is a very long message and you don't want it to show it. all over the place so remove it")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .lineLimit(2);
                    
                }.padding(.leading)
                Spacer();
            }.padding(.leading,6)
            .padding(9)
            
            Divider();
        }
        
    }
}

struct MessageCell_Previews: PreviewProvider {
    static var previews: some View {
        MessageCell()
    }
}
