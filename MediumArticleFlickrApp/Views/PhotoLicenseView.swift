//
//  PhotoLicenseView.swift
//  MyFlickrApp
//
//  Created by Jody Abney on 9/1/20.
//

import SwiftUI

struct PhotoLicenseView: View {
    
    var license: License
    
    var body: some View {
        VStack {
            Text("Photo License Info")
                .font(.subheadline)
            Text(license.name)
                .font(.caption)
            if let validURLString = license.urlString, validURLString != "" {
                Link(validURLString, destination: URL(string: validURLString)!)
                    .font(.caption)
            }
        }
        .padding()
        
    }
}

struct PhotoLicenseView_Previews: PreviewProvider {    
    static var previews: some View {
        Group {
            PhotoLicenseView(license: Licenses().licenseSource[0])
                .previewLayout(.sizeThatFits)
            PhotoLicenseView(license: Licenses().licenseSource[1])
                .previewLayout(.sizeThatFits)
            PhotoLicenseView(license: Licenses().licenseSource[2])
                .previewLayout(.sizeThatFits)
            PhotoLicenseView(license: Licenses().licenseSource[3])
                .previewLayout(.sizeThatFits)
            PhotoLicenseView(license: Licenses().licenseSource[4])
                .previewLayout(.sizeThatFits)
            PhotoLicenseView(license: Licenses().licenseSource[5])
                .previewLayout(.sizeThatFits)
        }
        Group {
            PhotoLicenseView(license: Licenses().licenseSource[6])
                .previewLayout(.sizeThatFits)
            PhotoLicenseView(license: Licenses().licenseSource[7])
                .previewLayout(.sizeThatFits)
            PhotoLicenseView(license: Licenses().licenseSource[8])
                .previewLayout(.sizeThatFits)
            PhotoLicenseView(license: Licenses().licenseSource[9])
                .previewLayout(.sizeThatFits)
            PhotoLicenseView(license: Licenses().licenseSource[10])
                .previewLayout(.sizeThatFits)
        }
    }
}
