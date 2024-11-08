//
//  DetailView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 08/11/24.
//


import SwiftUI

struct DetailView: View {
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                
                Spacer()
                
                   }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {  }) {
                        Image(systemName: "arrow.left")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Action for trailing button
                    }) {
                        Image(systemName: "bookmark.fill")
                    }
                }
              
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Action for trailing button
                    }) {
                        if let shareImage = UIImage(named: "share") {
                            Image(uiImage: shareImage)
                                .resizable() // Make it resizable if needed
                                .scaledToFit() //
                                .imageScale(.large)
                                .symbolVariant(.circle)
                                .frame(width: 20, height: 20)
                        }
                    }
                }
                
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Action for trailing button
                    }) {
                        Image(systemName: "gear")
                    }
                }
            }.onAppear {  }
        }
    }
    
    
    func onBookmarkClicked() {
        
    }
    
    func onShareClicked() {
        
    }
    
    func onSettingsClicked() {
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
