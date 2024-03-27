//
//  DetailView.swift
//  TestApp
//
//  Created by Orangeodc7 on 27/3/2024.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var detailViewModel : DetailViewModel
    let id :String
    
    var body: some View {
        VStack {
            if case .loading = self.detailViewModel.placeDetailState {
                ProgressView().progressViewStyle(.circular)
            }
            if case let .success (placeDetail) = self.detailViewModel.placeDetailState {   if let image = placeDetail.image {
                
                AsyncImage (url: URL(string:image)){
                    image in
                    image.image?.resizable().frame(width:300,height:200)
                }
            }
          
            HStack  {
                Label("", systemImage: "star.fill")
                  .padding()
                  .foregroundColor(.yellow)
            }.frame(maxWidth: .infinity,alignment:.trailing)
            
            VStack (alignment:.leading){
             
                Text(placeDetail.title).font(.system(size: 24))
                Text(placeDetail.adresse).font(.system(size: 16))
                Text(placeDetail.description ?? "").font(.system(size: 18))
                }.frame(maxWidth: .infinity,alignment:.leading)
            Spacer()
            HStack{
                Button{
                    
                }label: {
                    Text("visit wikipedia ").font(.system(size: 18))
                }
            }.frame(maxWidth: .infinity,alignment:.trailing)}
                
          
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity,alignment: .top).background(.white).padding(.horizontal,16).onAppear {
            self.detailViewModel.getPlaceDetail(id: self.id)
        }
        
    }
}


