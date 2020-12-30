//
//  FavoritesList.swift
//  MyFlickrFavorites
//
//  Created by Jody Abney on 9/18/20.
//

import SwiftUI

struct FavoritesList: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.favPhotos) { photo in
                NavigationLink(
                    destination: PhotoScreen(viewModel: viewModel, isFavorite: viewModel.isFavorite(photo: photo), photo: photo)
                ) {
                FavoritesListRow(photo: photo)
                }
            }
        }
    }
}

struct FavoritesList_Previews: PreviewProvider {    
    static var previews: some View {
        FavoritesList(viewModel: PreviewViewModel())
    }
}
