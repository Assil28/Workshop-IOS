//
//  HomeViewModel.swift
//  TestApp
//
//  Created by Orangeodc7 on 26/3/2024.
//

import Foundation
class HomeViewModel :ObservableObject {
    let placeMapper :PlaceMapper=PlaceMapper()
    func getAllPlaces(){
        Task {
          let result =  await self.placeMapper.getAllPlaces(url:Consts.URL)
            if case let .success(let success) = result {
                print(success)
            }
            else {
                print("error")
            }
        }
    }
}
