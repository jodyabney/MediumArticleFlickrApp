//
//  MainScreen.swift
//  MediumArticleFlickrApp
//
//  Created by Jody Abney on 12/6/20.
//

import SwiftUI

struct MainScreen: View {
    
    // Only minimal details of ViewModel are needed to declare
    // the initial interface using SwiftUI
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        TabView {
            // Flickr Photos
            NavigationView {
                VStack {
                    SearchBar(viewModel: viewModel)
                    PhotoCategoryPicker(viewModel: viewModel)
                        .padding([.leading, .trailing], 10)
                    
                    if viewModel.photos.count == 0 {
                        Spacer()
                        EmptySection()
                        Spacer()
                    } else {
                        PhotoGrid(viewModel: viewModel)
                    }
                }
                .navigationTitle("Flickr Photos")

            }
            .tabItem {
                VStack {
                    Image(systemName: "photo.on.rectangle")
                    Text("Flickr Photos")
                }
            }
            // Manage Favorites
            NavigationView {
                VStack {
                    if viewModel.favPhotos.count == 0 {
                        Spacer()
                        EmptySection()
                        Spacer()
                    } else {
                        SearchBar(viewModel: viewModel)
                        FavoritesList(viewModel: viewModel)
                    }
                }
                .navigationTitle("Manage Favorites")
            }
            .tabItem {
                VStack {
                    Image(systemName: "heart.circle")
                    Text("Manage Favorites")
                }
            }
            // Settings
            NavigationView {
                VStack {
                    SettingsScreen(viewModel: viewModel)
                }
                .navigationTitle("Settings")
            }
            .tabItem {
                VStack {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
            }
        }
    }
}



struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainScreen(viewModel: ViewModel())
            
            Landscape {
                MainScreen(viewModel: ViewModel())
            }
        }
    }
}
