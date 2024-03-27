//
//  HomeView.swift
//  TestApp
//
//  Created by Orangeodc7 on 26/3/2024.
//

import SwiftUI

struct HomeView:View {
    let places: [PlaceItem]=[
        
    ]
    
    let options=["My Location","Tunis","Djerba","Bizerte"]
    
    @State var selectedOption=0
    var body: some View {
        
        VStack{
            HStack{
                
                     Button(action: {
                     
                     }) {
                       Label("", systemImage: "gearshape.fill")
                         .padding()
                         .foregroundColor(.black)
                         
                         .cornerRadius(10)
                     }
                   
            }.frame(maxWidth:.infinity,alignment: .trailing)
            
            
            HStack{
                SearchBar(text: .constant(""))
            }
            
            
            HStack{
             
                VStack{
                    Text("Recent Places (\(places.count))").font(.title3)
                    Text("Range")
                }
                Spacer()
                Picker(
                    selection:$selectedOption, label: Text("")){
                        ForEach(0..<options.count){
                            option in
                            Text(
                                self.options[ option]
                            ).tag(option)
                        }
                    }
                
            }
            
            ForEach(self.places)
           { item in
               
               PlaceItemView(item: item)
               
           }
            
            
            
        }.frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).padding(.horizontal,8)
         
    }
}



#Preview {
    HomeView()
}
