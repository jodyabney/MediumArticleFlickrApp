//
//  Landscape.swift
//  MediumArticleFlickrApp
//
//  Created by Jody Abney on 12/21/20.
//

// Easily allows SwiftUI previews for Landscape orientation

import SwiftUI

struct Landscape<Content>: View where Content: View {
 let content: () -> Content
 let height = UIScreen.main.bounds.width // use width for height
 let width = UIScreen.main.bounds.height // use height for width
 var body: some View {
     content().previewLayout(PreviewLayout.fixed(width: width, height: height))
 }
}

