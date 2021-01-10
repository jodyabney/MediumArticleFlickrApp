//
//  FlickrFavoritesResponse.swift
//  MyFlickrFavorites
//
//  Created by Jody Abney on 9/18/20.
//

import Foundation

struct FlickrFavoritesResponse: Codable {
    let stat: String
    let code: String?
    let message: String?
}
