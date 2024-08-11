//
//  UserCountryView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 01/08/24.
//

import Foundation
import SwiftUI

struct UserCountryView: View {
   
    @State private var text: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Where do you come from?")
                .font(.title)
                .fontWeight(.semibold)
                .padding()
            
            Text("Select your country of origin. This will help us to make the best recommendation for you.")
                .font(.body)
                .padding(.horizontal)
            
            ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(height: 40)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                        
                        TextField("Search Country", text: $text)
                            .padding(.leading, 8) // Adjust padding to align text correctly
                    }
                    .padding(.horizontal)
                }
                .padding()
            
            List(CountryRepository.getCountries()) { country in
                HStack {
                    HStack {
                                       Text(country.flag)
                                           .font(.largeTitle)
                                       Text(country.name)
                                           .font(.headline)
                                   }
                                   .padding(.vertical, 8)
                }
            }
            
            Divider()
                .padding([.leading, .trailing, .bottom])
            
            HStack {
               
                Button(
                    action: { },
                    label: {
                        NavigationLink(destination: NewsCategoryView()) {
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

struct UserCountryView_Previews: PreviewProvider {
    static var previews: some View {
        UserCountryView()
    }
}
