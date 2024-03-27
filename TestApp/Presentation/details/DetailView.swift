//
//  DetailView.swift
//  TestApp
//
//  Created by Orangeodc7 on 27/3/2024.
//

import SwiftUI

struct DetailView: View {
    let placeDetail:PlaceDetail
    var body: some View {
        VStack {
            AsyncImage (url: URL(string:self.placeDetail.imageUrl)){
                image in
                image.image?.resizable().frame(width:300,height:200)
            }
            HStack  {
                Label("", systemImage: "star.fill")
                  .padding()
                  .foregroundColor(.yellow)
            }.frame(maxWidth: .infinity,alignment:.trailing)
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity,alignment: .top).background(.white).padding(.horizontal,16)
    }
}

#Preview {
    DetailView( placeDetail: PlaceDetail(imageUrl: "https://ims.ev.mu/shutterstock_1587872815_98e06d4f17/shutterstock_1587872815_98e06d4f17.jpg", title: "String", adresse: "Bizerte", description: "", wikipedia: ""))
}
