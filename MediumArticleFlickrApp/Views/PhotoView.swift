//
//  PhotoView.swift
//  MediumArticleFlickrApp
//
//  Created by Jody Abney on 12/20/20.
//

import KingfisherSwiftUI
import SwiftUI

struct PhotoView: View {
    
    @Binding var contentMode: ContentMode
    
    let photo: Photo
    
    var body: some View {
        // Display the photo
        KFImage(photo.remoteURL)
            // set photo display characteristics
            .resizable()
            .aspectRatio(contentMode: contentMode)
            .cornerRadius(10.0)
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(contentMode: .constant(.fit), photo: Photo.default)
    }
}
