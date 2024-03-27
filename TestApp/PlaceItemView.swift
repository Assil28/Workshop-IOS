//
//  ListPlaces.swift
//  TestApp
//
//  Created by Orangeodc7 on 26/3/2024.
//

import SwiftUI



struct PlaceItemView: View {
    let item:PlaceItem
    
    var body: some View {
        
        VStack{
        
                VStack(spacing:10){
                    
                    HStack{
                        Text(item.name).font(.title2)
                        Spacer()
                        VStack {
                             Button(action: {
                             
                             }) {
                               Label("", systemImage: "star.fill")
                                 .padding()
                                 .foregroundColor(.yellow)
                                 
                                 .cornerRadius(10)
                             }
                           }
                    }
                    
                    HStack{
                        Text(item.kinds).font(.title3).background(.gray).cornerRadius(5)
                        Spacer()
                        Text( "\(String(format:"%.1f m",item.distance))").font(.title2)}

                }
                Divider()
        }.padding(.horizontal,32)
          
    }
        
    
}

#Preview {
    PlaceItemView(item: PlaceItem(name: "test1", distance: 30, kinds: "historic"))
}
