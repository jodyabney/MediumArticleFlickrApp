//
//  FlickrResponse.swift
//  MyPhotoAppCombineSwiftui
//
//  Created by Jody Abney on 8/20/20.
//

struct FlickrPhotosInfoResponse: Codable {
    let photosInfo: FlickrPhotosResponse
    
    enum CodingKeys: String, CodingKey {
        case photosInfo = "photos"
    }
}
