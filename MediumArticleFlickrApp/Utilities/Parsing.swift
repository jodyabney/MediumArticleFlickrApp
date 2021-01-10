//
//  Parsing.swift
//  MyFlickrFavorites
//
//  Created by Jody Abney on 9/9/20.
//

import Combine
import Foundation

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, FlickrError> {
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .secondsSince1970

  return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
      .parsing(description: error.localizedDescription)
    }
    .eraseToAnyPublisher()
}
