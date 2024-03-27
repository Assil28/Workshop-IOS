//
//  GetAllPlacesState.swift
//  TestApp
//
//  Created by Orangeodc7 on 27/3/2024.
//

import Foundation
enum GetAllPlacesState {
    case loading
    case success ([PlaceItem])
    case error (String)
}
