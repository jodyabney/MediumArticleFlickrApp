//
//  License.swift
//  MyFlickrApp
//
//  Created by Jody Abney on 9/1/20.
//

import Foundation

struct License {
    let id: String
    let name: String
    let urlString: String?
}

struct Licenses {
    let licenseSource: [License] = [
        License(id: "0", name: "All Rights Reserved", urlString: nil),
        License(id: "1", name: "Attribution-NonCommercial-ShareAlike License",
                urlString: "https://creativecommons.org/licenses/by-nc-sa/2.0/"),
        License(id: "2", name: "Attribution-NonCommercial License",
                urlString: "https://creativecommons.org/licenses/by-nc/2.0/"),
        License(id: "3", name: "Attribution-NonCommercial-NoDerivs License",
                urlString: "https://creativecommons.org/licenses/by-nc-nd/2.0/"),
        License(id: "4", name: "Attribution License",
                urlString: "https://creativecommons.org/licenses/by/2.0/"),
        License(id: "5", name: "Attribution-ShareAlike License",
                urlString: "https://creativecommons.org/licenses/by-sa/2.0/"),
        License(id: "6", name: "Attribution-NoDerivs License",
                urlString: "https://creativecommons.org/licenses/by-nd/2.0/"),
        License(id: "7", name: "No known copyright restrictions",
                urlString: "https://www.flickr.com/commons/usage/"),
        License(id: "8", name: "United States Government Work",
                urlString: "http://www.usa.gov/copyright.shtml"),
        License(id: "9", name: "Public Domain Dedication (CC0)",
                urlString: "https://creativecommons.org/publicdomain/zero/1.0/"),
        License(id: "10", name: "Public Domain Mark",
                urlString: "https://creativecommons.org/publicdomain/mark/1.0/")
    ]
    
    func getPhotoLicense(id: String) -> License {
        guard Int(id)! >= 0 && Int(id)! < 11  else {
            return License(id: "99", name: "No Valid License Found", urlString: nil)
        }
        
        return self.licenseSource.first { license in
            license.id == id
        }!
    }
}
