//
//  PlaceMapper.swift
//  TestApp
//
//  Created by Orangeodc7 on 26/3/2024.
//

import Foundation
class PlaceMapper {
    
    let placedatasource :PlaceDataSource=PlaceDataSource()
    
    
    func getAllPlaces (url :String) async-> Result<[PlaceItem],Failure> {
        
         let result =  try? await  placedatasource.getAllPlaces(url: Consts.URL)
        if let result = result as? [PlaceItemResponse] {
            return .success(result.map{
                return PlaceItem(id:$0.xid ,name: $0.name, distance: $0.dist, kinds: $0.kinds.split(separator :",").map{ String ($0)})
            })
            
        }else {
            return .failure(Failure(message: "server error "))
        }
    }
    
    func getPlaceDetail (url :String) async-> Result<PlaceDetail,Failure> {
        
        let result =  try? await  placedatasource.getPlaceDetails(url: Consts.URLdetails)
        
        if let result = result as?PlaceDetailResponse {
            return .success(
                PlaceDetail(imageUrl: result.preview.source, title: result.name, adresse: adresse.city ?? "", description: result.wikipedia_extracts.text ?? "", wikipedia: result.wikipedia)
            )
            
        }else {
            return .failure(Failure(message: "server error "))
        }
    }
}
