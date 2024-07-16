//
//  HomeViewModel.swift
//  newsline
//
//  Created by Sheikh Mohideen on 13/07/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var images: [ImageModel] = []
    
    func fetchImages() {
           // Example URLs
           let imageUrls = [
               "https://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000MR0044631300503690E01_DXXX.jpg",
               "https://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000ML0044631300305227E03_DXXX.jpg",
               "https://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000MR0044631290503689E01_DXXX.jpg",
               "https://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000ML0044631290305226E03_DXXX.jpg",
               "https://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000MR0044631280503688E0B_DXXX.jpg",
               "https://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000ML0044631280305225E03_DXXX.jpg",
               "https://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000MR0044631270503687E03_DXXX.jpg",
               "https://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000ML0044631270305224E03_DXXX.jpg"
           ]
           
           // Map strings to URL
           self.images = imageUrls.compactMap { URL(string: $0) }.map { ImageModel(url: $0) }
       }
}
