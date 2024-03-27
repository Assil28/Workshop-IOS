//
//  TestAppApp.swift
//  TestApp
//
//  Created by Orangeodc7 on 26/3/2024.
//

import SwiftUI

@main
struct TestAppApp: App {
    
    @StateObject var homeViewModel : HomeViewModel = HomeViewModel(placeMapper: PlaceMapper())
    @StateObject var detailViewModel : DetailViewModel = DetailViewModel(placeMapper: PlaceMapper())

    var body: some Scene {
        WindowGroup {
            
            NavigationStack{
                HomeView()
            }.environmentObject(self.homeViewModel)
                .environmentObject(self.detailViewModel)
                
            
           

        }
    }
}
