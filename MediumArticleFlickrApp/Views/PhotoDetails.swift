//
//  PhotoDetails.swift
//  MyFlickrApp
//
//  Created by Jody Abney on 9/2/20.
//

import SwiftUI

struct PhotoDetails: View {
    
    var photo: Photo
    
    var body: some View {
        VStack {
            HStack {
                Text("Title")
                Spacer()
                Text(photo.title != "" ? photo.title : "No title")
                    .lineLimit(3)
                    .font(.headline)
                    .frame(alignment: .trailing)
            }
            .padding([.leading, .trailing])
            
            HStack {
                Text("Date Taken")
                Spacer()
                Text(photo.dateTaken)
                    .frame(alignment: .trailing)
            }
            .padding([.leading, .trailing])
            
            HStack {
                Text("Owner")
                Spacer()
                Text(photo.owner)
                    .frame(alignment: .trailing)
            }
            .padding([.leading, .trailing])
            
            if let height = photo.height, let width = photo.width {
                HStack {
                    Text("Image Size")
                    Spacer()
                    Text("\(height) X \(width)")
                        .frame(alignment: .trailing)
                }
                .padding([.leading, .trailing])
            }
            
            HStack {
                Text("View Count")
                Spacer()
                Text(photo.views)
                    .frame(alignment: .trailing)
            }
            .padding([.leading, .trailing])
        }
    }
}

struct PhotoDetails_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetails(photo: Photo.default)
            .previewLayout(.sizeThatFits)
    }
}
