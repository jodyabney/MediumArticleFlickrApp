//
//  NearbyPhotosView.swift
//  MediumArticleFlickrApp
//
//  Created by Jody Abney on 12/22/20.
//

import SwiftUI

struct NearbyPhotosView: View {
    
    @State var radiusUnits: String = "mi"
    @State var radius: Double = 3.0
    @State var maxValue: Double = 20.0
    
    let minValue = 0.0
    
    var body: some View {
        VStack {
            Text("Nearby Photos Radius")
                .font(.headline)
            HStack {
            Picker(selection: $radiusUnits,
                   label: Text("Radius Units"),
                   content: {
                    Text("miles").tag("mi")
                    Text("kilometers").tag("km")
                   })
                .onChange(of: radiusUnits, perform: { _ in
                    if radiusUnits == "mi" {
                        maxValue = 20
                        radius /= 1.6
                    } else {
                        maxValue = 32
                        radius *= 1.6
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
            }
            HStack {
                Text("0")
                Slider(value: $radius,
                       in: 0...Double(maxValue),
                       step: 1.0)
                    .onChange(of: radius, perform: { _ in
                        
                    })
                Text("\(Int(maxValue))")
            }
            Text("\(Int(radius.rounded()))")
        }
    }
}

struct NearbyPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        NearbyPhotosView()
            .previewLayout(.sizeThatFits)
    }
}
