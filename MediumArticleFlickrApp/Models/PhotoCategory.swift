//
//  PhotoCategoryP.swift
//  MyFlickrFavorites
//
//  Created by Jody Abney on 8/29/20.
//

enum PhotoCategory: String, CaseIterable, Identifiable {
    case favorites
    case interestingness
    case nearBy
    case notSelected
    case popular
    case recent

    var id: String { rawValue }
}
