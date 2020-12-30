//
//  SettingsScreen.swift
//  MediumArticleFlickrApp
//
//  Created by Jody Abney on 12/22/20.
//

import SwiftUI

struct SettingsScreen: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        Form {
            Section(header: Text("Photo Settings")) {
                PhotoFetchLimitView()
                IncludeRecentPhotosView(viewModel: viewModel)
                NearbyPhotosView()
            }
            Section(header: Text("Flickr Authentication")) {
                LoginView(viewModel: viewModel)
            }
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen(viewModel: ViewModel())
    }
}
