//
//  CreateProfileView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 01/08/24.
//

import Foundation
import SwiftUI

struct CreateProfileView: View {

    @State private var text: String = ""
    

    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading, spacing: 20.0) {
                Text("Create public profile 🌎")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.top)
                
                Text("This profile will appear public, so people can find you and the stories you share.")
                    .font(.body)
                    .padding(.horizontal)
                
                ScrollView {
                    VStack {
                        
                        VStack(alignment: .leading) {
                            Text("Full Name")
                                .font(.body)
                                .fontWeight(.semibold)
                                .padding([.top, .leading, .trailing])
                            
                            TextField("Full Name", text: $text)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Username")
                                .font(.body)
                                .fontWeight(.semibold)
                                .padding([.top, .leading, .trailing])
                            
                            TextField("Username", text: $text)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.horizontal)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Bio")
                                .font(.body)
                                .fontWeight(.semibold)
                                .padding([.top, .leading, .trailing])
                            
                            TextEditor(text: $text)
                                .frame(height: 100)
                                .border(Color.gray, width: 0.5)
                                .cornerRadius(4)
                                .padding(.horizontal)
                        
                        }
                    }
                } .scrollIndicators(.hidden).padding(.horizontal)
                
                Divider()
                    .padding([.leading, .trailing])
                
                HStack {
                   
                    Button(
                        action: { },
                        label: { Text("Finish").fontWeight(.semibold) })
                        .buttonStyle(ElevatedButtonStyle())
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                }.padding(.horizontal)
                
            }.toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Action for trailing button
                    }) {
                        Image(systemName: "chevron.left")
                    }
                }
            }
        }
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
    }
}

