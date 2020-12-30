//
//  CellPhotoView.swift
//  MediumArticleFlickrApp
//
//  Created by Jody Abney on 12/21/20.
//

import KingfisherSwiftUI
import SwiftUI

struct CellPhotoView: View {
    
    let photo: Photo
    
    var body: some View {
        // Display the photo
        KFImage(photo.remoteURL)
            // set photo display characteristics
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10.0)
    }
}

struct CellPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        CellPhotoView(photo: Photo.default)
            .previewLayout(.sizeThatFits)
    }
}


