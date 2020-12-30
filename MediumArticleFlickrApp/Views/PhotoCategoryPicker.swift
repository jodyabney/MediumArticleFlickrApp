//
//  PhotoCategoryPicker.swift
//  MediumArticleFlickrApp
//
//  Created by Jody Abney on 12/19/20.
//

import SwiftUI

struct PhotoCategoryPicker: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        Picker(selection: $viewModel.selectedCategory,
               label: Text("Photo Category Picker")) {
            Text("Interesting").tag(PhotoCategory.interestingness)
            // only show Recent photos option if enabled
            // via Settings screen
            if viewModel.includeRecentPhotos {
                Text("Recent").tag(PhotoCategory.recent)
            }
            Text("Near By").tag(PhotoCategory.nearBy)
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct PhotoCategoryPicker_Previews: PreviewProvider {    
    static var previews: some View {
        Group {
            PhotoCategoryPicker(viewModel: ViewModel())
                .previewLayout(.sizeThatFits)
            PhotoCategoryPicker(viewModel: PreviewViewModel())
                .previewLayout(.sizeThatFits)
        }
    }
}
