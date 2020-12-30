//
//  PhotoGrid.swift
//  MediumArticleFlickrApp
//
//  Created by Jody Abney on 12/6/20.
//

import SwiftUI

struct PhotoGrid: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var columnsAdaptive = [GridItem(.adaptive(minimum: 150, maximum: 300))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columnsAdaptive, content: {
                ForEach(viewModel.photos) {
                    photo in
                    PhotoGridCell(viewModel: viewModel, photo: photo)
                }
            })
        }
        .padding()
    }
}

struct PhotoGrid_Previews: PreviewProvider {
    static var previews: some View {        
        PhotoGrid(viewModel: ViewModel())
    }
}
