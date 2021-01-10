//
//  PhotoStore.swift
//  MyFlickrFavorites
//
//  Created by Jody Abney on 9/10/20.
//

import Combine
import Foundation
import SwiftUI
import UIKit

class PhotoStore: ObservableObject, Identifiable {
    
    @Published var photoCategory: PhotoCategory = .interestingness {
        didSet {
            if photoCategory == .nearBy {
                print("selected NearBy category")
            }
        }
    }
    @Published var dataSource: [Photo] = []
    @Published var favoritesSource: [Photo] = []
    @Published var photoFetchLimit: Double = 100.0
    @Published var includeRecentPhotos: Bool = false {
        didSet {
            if includeRecentPhotos == false {
                photoCategory = .interestingness
            }
        }
    }
    @Published var location = LocationService.shared
    
    // determine if the device type is an iPad or not
    var isPad: Bool = UIDevice.current.userInterfaceIdiom == .pad
    
    let flickrFetcher: FlickrFetchable
    private var disposables = Set<AnyCancellable>()
    
    // set up Flickr license values
    let flickrLicenses = Licenses()
    
    init(flickrFetcher: FlickrFetchable,
         scheduler: DispatchQueue = DispatchQueue(label: "PhotoStore")) {
        self.flickrFetcher = flickrFetcher
        
        $photoCategory
            .sink(receiveValue: fetchPhotos(forCategory:))
            .store(in: &disposables)
        
        fetchFavorites()
    }
    
    
    func fetchPhotos(forCategory photoCategory: PhotoCategory) {
        
        flickrFetcher.flickrPhotos(forCategory: photoCategory)
            .map(\.photosInfo)
            .map(\.photos)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    print("no photos retrieved")
                    self.dataSource = []
                case .finished:
                    print("photos found!")
                    break
                }
            },
            receiveValue: { [weak self] photos in
                guard let self = self else { return }
                print("photos count: \(photos.count)")
                // filter out any photos that don't return a remote URL to the actual image
                self.dataSource = photos.filter { $0.remoteURL != nil }
            })
            .store(in: &disposables)
    }
    
    func fetchFavorites() {
        
        flickrFetcher.flickrPhotos(forCategory: .favorites)
            .map(\.photosInfo)
            .map(\.photos)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    print("no favorites retrieved")
                    self.favoritesSource = []
                case .finished:
                    print("favorites found!")
                    break
                }
            },
            receiveValue: { [weak self] photos in
                guard let self = self else { return }
                print("photos count: \(photos.count)")
                // filter out any photos that don't return a remote URL to the actual image
                self.favoritesSource = photos.filter { $0.remoteURL != nil }
            })
            .store(in: &disposables)
    }
    
    func refresh() {
        let currentCat = photoCategory
        photoCategory = .popular
        photoCategory = currentCat
    }
    
    func manageFavorite(endPoint: EndPoint, photoID: String) {
        
        flickrFetcher.manageFavorite(endPoint: endPoint, photoID: photoID)
            .map(\.stat, \.code, \.message)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    print("Failed: manageFavorite was unsuccessful")
                    self.favoritesSource = []
                case .finished:
                    print("Success: manageFavorite succeeded!")
                    
                    switch endPoint {
                    case .addToFavorites:
                        break
                    case .removeFromFavorites:
                        let photoPosition = self.favoritesSource.firstIndex { return $0.id == photoID }
                        self.favoritesSource.remove(at: photoPosition!)
                    default:
                        break
                    }
                    
                }
            }, receiveValue: { [weak self] favoriteResponse in
                guard let self = self else { return }
                
                print("stat: \(favoriteResponse.0)")
                print("code: \(String(describing: favoriteResponse.1))")
                print("message: \(String(describing: favoriteResponse.2))")
                
                self.fetchFavorites()
            })
            .store(in: &disposables)
            
        
    }
    
    func isFavorite(photoID: String) -> Bool {
        return (favoritesSource.firstIndex(where: { $0.id == photoID }) != nil)
    }
    
}
