//
//  ViewModel.swift
//  MediumArticleFlickrApp
//
//  Created by Jody Abney on 12/25/20.
//

import Combine
import CoreLocation
import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    private var disposables = Set<AnyCancellable>()
    
    @Published var photoFetchLimit = 5.0
    @Published var radiusUnits = "mi"
    @Published var radius = 3.0
    
    @Published var location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 37.3172, longitude: -122.0385) // initialize to Cupertino, California
    
    @Published var authenticated: Bool = false
    
    // TODO: Undate URL when implementing Flickr Authentication
    @Published var flickrAuthenticationURLString: String = "http://www.flickr.com"
    
    @Published var flickrScreenName: String = "No Flickr ScreenName Available"
    
    @Published var includeRecentPhotos: Bool = false
    @Published var searchText: String = ""
    @Published var photoCategory: PhotoCategory = .interestingness
    
    // TODO: Replace with network/service calls for actual photos from Flickr
    @Published var photos: [Photo] = Photo.previewPhotos
    
    // TODO: Replace with network/service calls for actual photos from Flickr
    @Published var favPhotos: [Photo] = []
    
    private let session: URLSession
    
    init(session: URLSession = .shared,
         scheduler: DispatchQueue = DispatchQueue(label: "ViewModel")) {
        self.session = session
        
        $photoCategory
            .sink(receiveValue: fetchPhotos(forCategory:))
            .store(in: &disposables)
    }
    
    func fetchPhotos(forCategory photoCategory: PhotoCategory) {
        
        flickrPhotos(forCategory: photoCategory)
            .map(\.photosInfo)
            .map(\.photos)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.photos = []
                case .finished:
                    break
                }
                
            }
            , receiveValue: { [weak self] photos in
                guard let self = self else { return }
                // filter out any photos that don't have a remote URL to the actual image
                self.photos = photos.filter { $0.remoteURL != nil }
                
            }
            )
            .store(in: &disposables)
    }
    
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

extension ViewModel: FlickrFetchable {
    func flickrPhotos(forCategory category: PhotoCategory) -> AnyPublisher<FlickrPhotosInfoResponse, FlickrError> {
        
        switch category {
        case .interestingness:
            return fetch(with: flickrURLComponents(endPoint: .interestingPhotos))
        case .recent:
            return fetch(with: flickrURLComponents(endPoint: .recentPhotos))
        case .nearBy:
            return fetch(with: flickrURLComponents(endPoint: .locationPhotos))
        default:
            return fetch(with: flickrURLComponents(endPoint: .interestingPhotos))
        }
    }
    
    func manageFavorite(endPoint: EndPoint, photoID: String) -> AnyPublisher<FlickrFavoritesResponse, FlickrError> {
        
        let url: String = FlickrAPI.baseURLString
        let parameters: Dictionary = [
            "method"            : endPoint.rawValue,
            "format"            : "json",
            "nojsoncallback"    : "1",
            "photo_id"          : photoID
        ]
        
        // TODO: Finish coding OAuth calls for Favorites
        
        return fetch(with: flickrURLComponents(endPoint: .favoritePhotos))
    }
    
    private func fetch<T>(with components: URLComponents) -> AnyPublisher<T, FlickrError> where T: Decodable {
        
        // make sure we have a valid URL
        guard let url = components.url else {
            let error = FlickrError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                .network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { result in
                decode(result.data)
            }
            .eraseToAnyPublisher()
    }
    
    
}

//MARK: - Flickr API

extension ViewModel {
    
    func flickrURLComponents(endPoint: EndPoint) -> URLComponents {
        
        var components = URLComponents(string: FlickrAPI.baseURLString)!
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "method": endPoint.rawValue,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": FlickrAPI.apiKey
        ]
        
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        var additionalParameters = [
            "extras" : "date_taken,geo,license,machine_tags,owner_name,url_z,views"
        ]
        
        if endPoint == .locationPhotos {
            additionalParameters["lat"] = String(location.latitude)
            additionalParameters["lon"] = String(location.longitude)
            additionalParameters["radius"] = String(Int(radius))
            additionalParameters["radius_units"] = radiusUnits
        }
        
        if endPoint == .favoritePhotos {
            // TODO: Handle authentication for accessing favorite photos

        }
        
        if endPoint == .addToFavorites || endPoint == .removeFromFavorites {
            // TODO: Handle authentication for managing favorite photos

        } else {
            // include photo fetch limit if this is a photo fetch
            additionalParameters["per_page"] = String(Int(photoFetchLimit))
        }
        
        for (key, value) in additionalParameters {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        components.queryItems = queryItems
        
        return components
    }
}
