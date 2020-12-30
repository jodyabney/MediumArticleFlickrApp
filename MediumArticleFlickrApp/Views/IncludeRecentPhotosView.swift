//
//  IncludeRecentPhotosView.swift
//  MediumArticleFlickrApp
//
//  Created by Jody Abney on 12/22/20.
//

import SwiftUI

struct IncludeRecentPhotosView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Recent Photos")
                .font(.headline)
            Toggle(isOn: $viewModel.includeRecentPhotos, label: {
                Text("Include 'Recent' Photos?")
            })
            Text("Flickr non-curated content such as 'Recent' photos may contain Not Safe For Work images")
                .font(.subheadline)
                .fontWeight(.ultraLight)
        }
    }
}


struct IncludeRecentPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        IncludeRecentPhotosView(viewModel: ViewModel())
            .previewLayout(.sizeThatFits)
    }
}



