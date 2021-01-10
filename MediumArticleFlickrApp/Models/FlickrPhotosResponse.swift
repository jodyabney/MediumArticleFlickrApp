//
//  FlickrPhotosResponse.swift
//  MyPhotoAppCombineSwiftui
//
//  Created by Jody Abney on 8/20/20.
//

struct FlickrPhotosResponse: Codable {
    let photos: [Photo]
    
    enum CodingKeys: String, CodingKey {
        case photos = "photo"
    }
}
