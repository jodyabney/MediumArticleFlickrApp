//
//  FlickerFetchable.swift
//  MediumArticleFlickrApp
//
//  Created by Jody Abney on 1/7/21.
//

import Combine

protocol FlickrFetchable {
    func flickrPhotos(forCategory category: PhotoCategory) -> AnyPublisher<FlickrPhotosInfoResponse, FlickrError>
    
    func manageFavorite(endPoint: EndPoint, photoID: String) -> AnyPublisher<FlickrFavoritesResponse, FlickrError>
}
