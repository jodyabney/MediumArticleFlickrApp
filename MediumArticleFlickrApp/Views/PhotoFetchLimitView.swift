//
//  PhotoFetchLimitView.swift
//  MediumArticleFlickrApp
//
//  Created by Jody Abney on 12/22/20.
//

import SwiftUI

struct PhotoFetchLimitView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    let minimumValue = 5.0
    let maximumValue = 500.0 // maximum Flickr allows for API photo calls
    
    var body: some View {
        VStack {
            Text("Photo Fetch Limit")
                .font(.headline)
            HStack {
                Text("\(Int(minimumValue))")
                Slider(value: $viewModel.photoFetchLimit,
                       in: minimumValue...maximumValue,
                       step: 5)
                    .onChange(of: viewModel.photoFetchLimit) { value in
                        // TODO: Implement with ViewModel details
                    }
                Text("\(Int(maximumValue))")
            }
            Text("\(Int(viewModel.photoFetchLimit))")
            Text("Controls the number of photos fetched from Flickr for each of the photo categories")
                .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                .fontWeight(.ultraLight)
        }
    }
}


struct PhotoFetchLimitView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoFetchLimitView(viewModel: ViewModel())
            .previewLayout(.sizeThatFits)
    }
}


