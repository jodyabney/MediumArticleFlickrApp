//
//  EndPoint.swift
//  MyPhotoAppCombineSwiftui
//
//  Created by Jody Abney on 8/20/20.
//

enum EndPoint: String {
    case interestingPhotos = "flickr.interestingness.getList"
    case recentPhotos = "flickr.photos.getRecent"
    case locationPhotos = "flickr.photos.search"
    case favoritePhotos = "flickr.favorites.getList"
    case addToFavorites = "flickr.favorites.add"
    case removeFromFavorites = "flickr.favorites.remove"
}
