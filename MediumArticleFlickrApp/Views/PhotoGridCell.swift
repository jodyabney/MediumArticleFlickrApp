//
//  PhotoGridCell.swift
//  MediumArticleFlickrApp
//
//  Created by Jody Abney on 12/6/20.
//

import KingfisherSwiftUI
import SwiftUI

struct PhotoGridCell: View {
    
    @ObservedObject var viewModel: ViewModel
    
    let photo: Photo
    
    @State var isActive = false
    
    var body: some View {
        ZStack {
            // Show a progress view until the photo overlays it
            ProgressView()
            // Display the photo
            CellPhotoView(photo: photo)
                // set up for tap navigation
                .onTapGesture {
                    self.isActive.toggle()
                }
                .background(NavigationLink(
                                destination: PhotoScreen(viewModel: viewModel,
                                                         isFavorite: viewModel.isFavorite(photo: photo),
                                                         photo: photo),
                                isActive: $isActive) { EmptyView() }
                )
        }
        .padding()
    }
}

struct PhotoGridCell_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGridCell(viewModel: ViewModel(), photo: Photo.default)
    }
}
