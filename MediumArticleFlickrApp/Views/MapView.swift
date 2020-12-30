//
//  MapView.swift
//  MediumArticleFlickrApp
//
//  Created by Jody Abney on 12/21/20.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
        uiView.isZoomEnabled = true
        
        let annotation = MKPointAnnotation()
        annotation.title = ""
        annotation.coordinate = coordinate
        uiView.addAnnotation(annotation)
    }
}

struct MapView_Previews: PreviewProvider {
    
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: Double(Photo.default.latitude)!, longitude: Double(Photo.default.longitude)!))
            .previewLayout(.sizeThatFits)
    }
}
