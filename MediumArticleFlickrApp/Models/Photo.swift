//
//  Photo.swift
//  MyPhotoAppSwiftUI
//
//  Created by Jody Abney on 7/28/20.
//  Copyright © 2020 AbneyAnalytics. All rights reserved.
//

import Foundation

struct Photo: Codable, Identifiable {
    let title: String
    let remoteURL: URL?
    let id: String
    let dateTaken: String
    let height: Int?
    let width: Int?
    let owner: String
    let views: String
    let license: String
    @CodableValue var latitude: String // handle Flickr API returning an Int or a String
    @CodableValue var longitude: String // handle Flickr API returning an Int or a String
    @CodableValue var accuracy: String // handle Flickr API returning an Int or a String
    
//    var isFavorite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case title
        case remoteURL = "url_z"
        case id = "id"
        case dateTaken = "datetaken"
        case height = "height_z"
        case width = "width_z"
        case owner = "ownername"
        case views
        case license
        case latitude
        case longitude
        case accuracy
    }
    
//    mutating func addPhotoToFavorites() {
//        isFavorite = true
//    }
//
//    mutating func removePhotoFromFavorites() {
//        isFavorite = false
//    }
    
    // use as preview data for SwiftUI
    static var `default`: Photo {
        Photo(title: "Flamingos By The Golden Sunset",
              remoteURL: URL(string: "https://live.staticflickr.com/65535/50392963378_b2954d2021_z.jpg"),
              id: "50392963378",
              dateTaken: "2017-08-01 09:14:37",
              height: 427,
              width: 640,
              owner: "126108137@N05",
              views: "13375",
              license: "0",
              latitude: "43.462825",
              longitude: "4.484825",
              accuracy: "13")
    }
    
    static var `previewPhotos`: [Photo] {
        [
            Photo(title: "Nuts.",
                  remoteURL: URL(string: "https://live.staticflickr.com/65535/50728793393_6fac389f5c_z.jpg"),
                  id: "50728793393",
                  dateTaken: "2009-12-02 09:33:49",
                  height: 425,
                  width: 640,
                  owner: "123653963@N02",
                  views: "86190",
                  license: "0",
                  latitude: "40.096753",
                  longitude: "-75.071811",
                  accuracy: "14"),
            Photo(title: "Grandpa's house (winter)",
                  remoteURL: URL(string: "https://live.staticflickr.com/65535/50731915118_06965bda40_z.jpg"),
                  id: "50731915118",
                  dateTaken: "2020-10-08 15:28:26",
                  height: 640,
                  width: 457,
                  owner: "116475418@N03",
                  views: "87874",
                  license: "0",
                  latitude: "0",
                  longitude: "0",
                  accuracy: "0"),
            Photo(title: "DSC29544 Makro 2020- in Explore #3  18.12.20",
                  remoteURL: URL(string: "https://live.staticflickr.com/65535/50730266153_c40619fc56_z.jpg"),
                  id: "50730266153",
                  dateTaken: "2020-09-11 14:49:33",
                  height: 427,
                  width: 640,
                  owner: "158685238@N03",
                  views: "85248",
                  license: "0",
                  latitude: "0",
                  longitude: "0",
                  accuracy: "0"),
            Photo(title: "Blue-gray Gnatcatcher  Legacy Park Malibu Southern California_143",
                  remoteURL: URL(string: "https://live.staticflickr.com/65535/50732064026_0049e2746a_z.jpg"),
                  id: "50732064026",
                  dateTaken: "2020-12-11 17:10:46",
                  height: 367,
                  width: 640,
                  owner: "37834207@N06",
                  views: "67735",
                  license: "0",
                  latitude: "34.035869",
                  longitude: "-118.688950",
                  accuracy: "14"),
            Photo(title: "Table Mountain",
                  remoteURL: URL(string: "https://live.staticflickr.com/65535/50731748603_62e36cff30_z.jpg"),
                  id: "50731748603",
                  dateTaken: "2020-10-29 22:30:35",
                  height: 415,
                  width: 640,
                  owner: "144273526@N06",
                  views: "58449",
                  license: "3",
                  latitude: "0",
                  longitude: "0",
                  accuracy: "0"),
            Photo(title: "Hintersee",
                  remoteURL: URL(string: "https://live.staticflickr.com/65535/50733608946_b27b930403_z.jpg"),
                  id: "50733608946",
                  dateTaken: "2020-10-15 07:53:15",
                  height: 427,
                  width: 640,
                  owner: "95566715@N08",
                  views: "54954",
                  license: "0",
                  latitude: "0",
                  longitude: "0",
                  accuracy: "0"),
            Photo(title: "l o c o m o t i v e",
                  remoteURL: URL(string: "https://live.staticflickr.com/65535/50732421891_808c3a69df_z.jpg"),
                  id: "50732421891",
                  dateTaken: "2018-10-09 13:03:28",
                  height: 400,
                  width: 640,
                  owner: "131793185@N08",
                  views: "49369",
                  license: "0",
                  latitude: "0",
                  longitude: "0",
                  accuracy: "0"),
            Photo(title: "Night of 1000 Candles 2020 (in Explore - Thanks!)",
                  remoteURL: URL(string: "https://live.staticflickr.com/65535/50728842728_16e23aa717_z.jpg"),
                  id: "50728842728",
                  dateTaken: "2020-12-10 02:14:24",
                  height: 427,
                  width: 640,
                  owner: "64659159@N02",
                  views: "41619",
                  license: "0",
                  latitude: "0",
                  longitude: "0",
                  accuracy: "0"),
            Photo(title: "Bad weather",
                  remoteURL: URL(string: "https://live.staticflickr.com/65535/50732057441_3e89f83589_z.jpg"),
                  id: "50732057441",
                  dateTaken: "2019-12-06 14:12:06",
                  height: 427,
                  width: 640,
                  owner: "96039744@N08",
                  views: "55562",
                  license: "6",
                  latitude: "0",
                  longitude: "0",
                  accuracy: "0"),
            Photo(title: "Boat and Sunset",
                  remoteURL: URL(string: "https://live.staticflickr.com/65535/50732168417_384fa66419_z.jpg"),
                  id: "50732168417",
                  dateTaken: "2012-08-27 19:23:26",
                  height: 427,
                  width: 640,
                  owner: "183705039@N08",
                  views: "29392",
                  license: "0",
                  latitude: "0",
                  longitude: "0",
                  accuracy: "0"),
            Photo(title: "End of the Road",
                  remoteURL: URL(string: "https://live.staticflickr.com/65535/50730950288_daecced5cd_z.jpg"),
                  id: "50730950288",
                  dateTaken: "2020-12-17 18:06:32",
                  height: 640,
                  width: 427,
                  owner: "119400285@N07",
                  views: "25981",
                  license: "0",
                  latitude: "0",
                  longitude: "0",
                  accuracy: "0"),
            Photo(title: "Window Pain",
                  remoteURL: URL(string: "https://live.staticflickr.com/65535/50728256067_9a27940f04_z.jpg"),
                  id: "50728256067",
                  dateTaken: "2020-08-27 18:35:30",
                  height: 543,
                  width: 640,
                  owner: "129588807@N08",
                  views: "21995",
                  license: "0",
                  latitude: "0",
                  longitude: "0",
                  accuracy: "0")
            
        ]
    }
}

