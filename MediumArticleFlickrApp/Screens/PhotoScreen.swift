//
//  PhotoScreen.swift
//  MediumArticleFlickrApp
//
//  Created by Jody Abney on 12/20/20.
//

import MapKit
import SwiftUI

struct PhotoScreen: View {
    // Handle device sizes to allow the views to change based on horizontal class size
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    @ObservedObject var viewModel: ViewModel
    
    @State var isFavorite: Bool
    
    let licenses = Licenses()
    var photo: Photo
    
    // photo content mode
    @State var contentMode = ContentMode.fit
    
    // Computed property for offset in overlaps
    var offsetValue: CGFloat {
        horizontalSizeClass == UserInterfaceSizeClass.compact ? -130 : 0
    }
    
    var body: some View {
        if horizontalSizeClass == UserInterfaceSizeClass.compact {
            VStack {
                PhotoScreenView(contentMode: $contentMode,
                                photo: photo,
                                offsetValue: offsetValue)
                
                if contentMode == .fit {
                    // Set up photo details view
                    PhotoDetails(photo: photo)
                    
                    Spacer()
                    
                    // Set up photo license view
                    PhotoLicenseView(license: licenses.getPhotoLicense(id: photo.license))
                }
            }
            .navigationBarTitle(Text(photo.title))
            .navigationBarItems(trailing: viewModel.authenticated ?
                                    Button(action: {
                                        if !isFavorite {
                                            viewModel.favPhotos.append(photo)
                                        } else {
                                            let _ = viewModel.favPhotos.removeAll { (vmPhoto) -> Bool in
                                                vmPhoto.id == photo.id
                                            }
                                        }
                                        isFavorite.toggle()
                                        
                                        // TODO: Implement actual add/remove fav functionality with ViewModel
                                        
                                    } ) {
                                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                                    } : nil )
            
        } else {
            HStack {
                PhotoScreenView(contentMode: $contentMode,
                                photo: photo,
                                offsetValue: offsetValue)
                
                if contentMode == .fit {
                    VStack {
                        // Set up photo details view
                        PhotoDetails(photo: photo)
                        
                        Spacer()
                        
                        // Set up photo license view
                        PhotoLicenseView(license: licenses.getPhotoLicense(id: photo.license))
                    }
                    .padding()
                }
            }
            .navigationBarTitle(Text(photo.title))
            .navigationBarItems(trailing: viewModel.authenticated ?
                                    Button(action: {
                                        if !isFavorite {
                                            viewModel.favPhotos.append(photo)
                                        } else {
                                            let _ = viewModel.favPhotos.drop { (vmPhoto) -> Bool in
                                                vmPhoto.id == photo.id
                                            }
                                        }
                                        isFavorite.toggle()
                                        
                                        // TODO: Implement actual add/remove fav functionality with ViewModel
                                        
                                    } ) {
                                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                                    } : nil )
        }
    }
}


struct PhotoScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PhotoScreen(viewModel: ViewModel(), isFavorite: false, photo: Photo.default)
                .environment(\.horizontalSizeClass, UserInterfaceSizeClass.compact)
            
            PhotoScreen(viewModel: ViewModel(), isFavorite: true, photo: Photo.default, contentMode: .fill)
                .environment(\.horizontalSizeClass, UserInterfaceSizeClass.compact)
            
            Landscape {
                PhotoScreen(viewModel: ViewModel(), isFavorite: false, photo: Photo.default, contentMode: .fit)
                    .previewDevice("iPhone 12 Pro Max")
                    .environment(\.horizontalSizeClass, UserInterfaceSizeClass.regular)
            }
            
            Landscape {
                PhotoScreen(viewModel: ViewModel(), isFavorite: true, photo: Photo.default, contentMode: .fill)
                    .previewDevice("iPhone 12 Pro Max")
                    .environment(\.horizontalSizeClass, UserInterfaceSizeClass.regular)
            }
        }
    }
}

