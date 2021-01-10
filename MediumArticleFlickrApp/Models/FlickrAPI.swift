//
//  FlickrAPI.swift
//  MyFlickrFavorites
//
//  Created by Jody Abney on 9/13/20.
//

import Foundation

struct FlickrAPI {
    // urls
    static let baseURLString = "https://api.flickr.com/services/rest"
    static let requestTokenURL = "https://www.flickr.com/services/oauth/request_token"
    static let authorizeURL = "https://www.flickr.com/services/oauth/authorize"
    static let accessTokenURL = "https://www.flickr.com/services/oauth/access_token"
    
    // keys and tokens
    static let apiKey = "eeeb1f70e2b397eaf6283d8bd2e95ddb"
    static let secretKey = "af5a1a711b480150"
}
