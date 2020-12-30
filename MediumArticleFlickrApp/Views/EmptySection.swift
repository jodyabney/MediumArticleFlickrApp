//
//  EmptySection.swift
//  MyFlickrFavorites
//
//  Created by Jody Abney on 9/17/20.
//

import SwiftUI

struct EmptySection: View {
    var body: some View {
            Section {
                Text("No photos retrieved")
                    .foregroundColor(.gray)
            }
    }
}

struct EmptySection_Previews: PreviewProvider {
    static var previews: some View {
        EmptySection()
            .previewLayout(.sizeThatFits)
    }
}
