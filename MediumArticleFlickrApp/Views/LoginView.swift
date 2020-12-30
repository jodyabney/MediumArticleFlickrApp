//
//  LoginView.swift
//  MyFlickrApp
//
//  Created by Jody Abney on 9/3/20.
//

import SwiftUI

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    @State var isPresented: Bool = false
    
    // TODO: Update URLString when Flickr Authentication is implemented
    @State var url: URL? = URL(string: "https://www.flickr.com")
    
    var body: some View {
        VStack(alignment: .center) {
            if !viewModel.authenticated {
                Button(action: {
                    isPresented.toggle()
                    // TODO: Implement Flickr Authentication
                    viewModel.authenticated = true
                }) {
                    HStack(alignment: .center) {
                        Spacer()
                        Text("Login to Flickr")
                        Spacer()
                    }
                }
            } else {
                HStack {
                    Spacer()
                    VStack {
                        VStack(alignment: .center) {
                            Text("Flickr authentication successful")
                            Text("Screen Name: \(viewModel.flickrScreenName)")
                                .font(.subheadline)
                        }
                        Spacer()
                        Button(action: {
                            // TODO: Implement Flickr Logout
                            viewModel.authenticated = false
                        }) {
                            Text("Logout from Flickr")
                        }
                    }
                    
                    Spacer()
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            SafariView(url: $url)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: ViewModel())
            .previewLayout(.sizeThatFits)
    }
}

