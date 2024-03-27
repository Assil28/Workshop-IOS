//
//  HomeViewModel.swift
//  TestApp
//
//  Created by Orangeodc7 on 26/3/2024.
//

import Foundation
class HomeViewModel :ObservableObject {
    
    let placeMapper :PlaceMapper
    
    init(placeMapper: PlaceMapper) {
        self.placeMapper = placeMapper
    }
   @Published var getAllPlacesStates : GetAllPlacesState = .loading
    
    func getAllPlaces(){
        Task {
          let result =  await self.placeMapper.getAllPlaces(url:Consts.URL)
            if case  .success(let places) = result {
                DispatchQueue.main.async{
                    self.getAllPlacesStates = .success(places)
                }
                
                
             
            }
            else if case  .failure(let error) = result {
                DispatchQueue.main.async{
                    self.getAllPlacesStates = .error(error.message)
                }
                
            }
        }
    }
}
