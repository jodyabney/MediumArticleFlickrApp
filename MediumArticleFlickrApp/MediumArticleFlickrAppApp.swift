//
//  MediumArticleFlickrAppApp.swift
//  MediumArticleFlickrApp
//
//  Created by Jody Abney on 12/6/20.
//

import SwiftUI

@main
struct MediumArticleFlickrAppApp: App {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainScreen(viewModel: viewModel)
        }
    }
    
}
