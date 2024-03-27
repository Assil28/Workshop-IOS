//
//  DetailViewModel.swift
//  TestApp
//
//  Created by Orangeodc7 on 27/3/2024.
//

import Foundation
class DetailViewModel:ObservableObject {
    let placeMapper :PlaceMapper
    
    init(placeMapper: PlaceMapper) {
        self.placeMapper = placeMapper
    }
    @Published var placeDetailState :GetDetailStates = .loading
    
    func getPlaceDetail (id:String) {
        Task {
            let result =  await placeMapper.getPlaceDetail(url: "\(Consts.URLdetails)\(id)?apiKey" )
            if case .success(let PlaceDetail) = result {
                DispatchQueue.main.async{
                    self.placeDetailState = .success(PlaceDetail)
                }
            }
            else if case .failure(let error ) = result {
                DispatchQueue.main.async{
                    self.placeDetailState = .error(error.message)
                }
                
            }
        }
    }
}
