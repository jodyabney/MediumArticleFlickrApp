//
//  PhotoScreenView.swift
//  MediumArticleFlickrApp
//
//  Created by Jody Abney on 12/21/20.
//

import MapKit
import SwiftUI

struct PhotoScreenView: View {
    
    @Binding var contentMode: ContentMode
    
    let photo: Photo
    
    let offsetValue: CGFloat
    
    // Computed property to determine if photo coordinates are valid
    var photoHasCoordinates: Bool {
        if photo.latitude != "0" && photo.longitude != "0" {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        if photoHasCoordinates && contentMode == .fit {
            MapView(coordinate: CLLocationCoordinate2D(latitude: Double(photo.latitude)!, longitude: Double(photo.longitude)!))
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
        }
        
        // Set up Photo
        PhotoView(contentMode: $contentMode, photo: photo)
            .padding()
            .offset(x: 0, y: photoHasCoordinates ? offsetValue : 0)
            .padding(.bottom, photoHasCoordinates ? offsetValue : 0)
            .shadow(radius: 10)
            .animation(.spring())
            .onTapGesture {
                withAnimation {
                    if contentMode == ContentMode.fit {
                        contentMode = ContentMode.fill
                    } else {
                        contentMode = ContentMode.fit
                    }
                }
            }
        
        // TODO: Handle zoom and pan of photo
        
    }
}

struct PhotoScreenView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoScreenView(contentMode: .constant(ContentMode.fit),
                        photo: Photo.default,
                        offsetValue: 0)
    }
}
