//
//  PreiewViewModel.swift
//  MediumArticleFlickrApp
//
//  Created by Jody Abney on 12/28/20.
//

import Foundation

class PreviewViewModel: ViewModel {
    override init() {
        super.init()
        self.authenticated = true
        self.favPhotos = Photo.previewPhotos
        self.includeRecentPhotos = true
    }
}
