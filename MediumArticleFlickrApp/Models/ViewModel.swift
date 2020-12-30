//
//  ViewModel.swift
//  MediumArticleFlickrApp
//
//  Created by Jody Abney on 12/25/20.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var authenticated: Bool = false
    
    // TODO: Undate URL when implementing Flickr Authentication
    @Published var flickrAuthenticationURLString: String = "http://www.flickr.com"
    
    @Published var flickrScreenName: String = "No Flickr ScreenName Available"
    @Published var includeRecentPhotos: Bool = false
    @Published var searchText: String = ""
    @Published var selectedCategory: PhotoCategory = .interestingness
    
    // TODO: Replace with network/service calls for actual photos from Flickr
    @Published var photos: [Photo] = Photo.previewPhotos
    
    // TODO: Replace with network/service calls for actual photos from Flickr
    @Published var favPhotos: [Photo] = []
    
    
    func setUpFavorites() {
        // TODO: Establish favorites process
        // Read the favorites and union those with the photo results
    }
    
    func isFavorite(photo: Photo) -> Bool {
        guard let _ = favPhotos.firstIndex(where: { (vmPhoto) -> Bool in
            vmPhoto.id == photo.id
        }) else { return false }
        return true
    }
    
}
