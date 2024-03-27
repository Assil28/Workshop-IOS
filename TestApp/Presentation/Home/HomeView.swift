//
//  HomeView.swift
//  TestApp
//
//  Created by Orangeodc7 on 26/3/2024.
//

import SwiftUI

struct HomeView:View {

    
    let options=["My Location","Tunis","Djerba","Bizerte"]
    
    @State var selectedOption=0
    @EnvironmentObject var homeViewModel : HomeViewModel
    let places:[PlaceItem]=[PlaceItem(name: "tete", distance: 34, kinds: ["String"])]
    
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
            
            
            
            
            if case .loading = self.homeViewModel.getAllPlacesStates{
                HStack{
                    ProgressView().progressViewStyle(.circular)
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight:.infinity)
            }else if  case  let .success(places) = self.homeViewModel.getAllPlacesStates{
                
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
                ScrollView(showsIndicators: false){
                    
                    ForEach(places)
                    { item in
                       
                        NavigationLink{
                            DetailView(id: "W27922391")
                        }label: {
                            PlaceItemView(item: item)
                            
                        }.buttonStyle(PlainButtonStyle())
                   }
                }
                
            }
           
            
            
            
        }.frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).padding(.horizontal,8).onAppear{
            self.homeViewModel.getAllPlaces()
        }
         
    }
}



#Preview {
    HomeView()
}
