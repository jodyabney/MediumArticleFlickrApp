//
//  FavoritesRow.swift
//  MyFlickrFavorites
//
//  Created by Jody Abney on 9/18/20.
//

import KingfisherSwiftUI
import SwiftUI

struct FavoritesListRow: View {
    
//    @EnvironmentObject var viewModel: PhotoStore
    
    var photo: Photo
    
    var body: some View {
        HStack {
            ZStack {
                ProgressView()
                KFImage(photo.remoteURL)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading) {
                Text(photo.title)
                    .font(.headline)
            }
            .padding(.leading)
        }
    }
}


struct FavoritesListRow_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListRow(photo: Photo.default)
            .previewLayout(.sizeThatFits)
    }
}
