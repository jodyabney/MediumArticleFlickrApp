//
//  FlickrError.swift
//  MyFlickrFavorites
//
//  Created by Jody Abney on 9/9/20.
//

import Foundation

enum FlickrError: Error {
  case parsing(description: String)
  case network(description: String)
}
