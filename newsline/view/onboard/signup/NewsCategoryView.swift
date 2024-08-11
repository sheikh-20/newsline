//
//  NewsCategoryView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 01/08/24.
//

import Foundation
import SwiftUI

struct NewsCategoryView: View {

    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20.0) {
            Text("Where do you come from?")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal)
                .padding(.top)
            
            Text("Select your country of origin. This will help us to make the best recommendation for you.")
                .font(.body)
                .padding(.horizontal)
            
            ScrollView {
                LazyVGrid(columns: [ GridItem(), GridItem(), GridItem() ],
                          spacing: 8.0) {
                    ForEach(NewsCategoryRepository.getNewsCategory()) { category in
                        VStack(spacing: 16.0) {
                            Text(category.img).font(.largeTitle)
                            Text(category.category)
                                .font(.subheadline)
                                .fontWeight(.medium)
                            }
                            .padding(.vertical, 8)
                    }
                }
            }
            
            Divider()
                .padding([.leading, .trailing])
            
            HStack {
               
                Button(
                    action: { },
                    label: {
                        NavigationLink(destination: NewsPublisherView()) {
                            Text("Continue").fontWeight(.semibold)
                        }
                    })
                    .buttonStyle(ElevatedButtonStyle())
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
            }.padding(.horizontal)
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                }
            }
        }
    }
}

struct NewsCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCategoryView()
    }
}
