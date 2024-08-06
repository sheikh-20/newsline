//
//  NewsPublisherView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 01/08/24.
//

import Foundation
import SwiftUI

struct NewsPublisherView: View {

    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading, spacing: 20.0) {
                Text("Follow some official publishers ❤️")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.top)
                
                Text("Follow some official publishers that you may know and like to get updates on their stories.")
                    .font(.body)
                    .padding(.horizontal)
                
                List(PublishersRepository.getOfficialPublishers()) { publisher in
                    HStack {
                        HStack {
                            Text(publisher.title).font(.headline)
                            
                            Spacer()
                            
                            Button(action: { }, label: {
                                Text("Follow")
                            })
                            
                               }
                                .padding(.vertical, 8)
                    }
                }
                
                
                Divider()
                    .padding([.leading, .trailing])
                
                HStack {
                   
                    Button(
                        action: { },
                        label: { Text("Continue").fontWeight(.semibold) })
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

struct NewsPublisherView_Previews: PreviewProvider {
    static var previews: some View {
        NewsPublisherView()
    }
}

