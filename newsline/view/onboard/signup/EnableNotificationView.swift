//
//  NotificationView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 01/08/24.
//

import Foundation
import SwiftUI

struct EnableNotificationView: View {

    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading, spacing: 20.0) {
                Text("Enable notifications 🔔")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.top)
                
                Text("Stay updated, never miss a story. Receive notifications for breaking news and personalized updates.")
                    .font(.body)
                    .padding(.horizontal)
                
                ScrollView {
                    VStack {
                        
                        HStack(alignment: .center) {
                            Text("Breaking news notifications")
                                .lineLimit(1)
                                .truncationMode(.tail)
                            
                            Spacer()
                            Toggle("", isOn: .constant(true)).labelsHidden()
                        }.frame(maxWidth: .infinity).padding(.top)
                        
                        HStack(alignment: .center) {
                            Text("News recommendations")
                                .lineLimit(1)
                                .truncationMode(.tail)
                            
                            Spacer()
                            Toggle("", isOn: .constant(true)).labelsHidden()
                        }.frame(maxWidth: .infinity).padding(.top)
                        
                        
                        HStack(alignment: .center) {
                            Text("Top story notifications")
                                .lineLimit(1)
                                .truncationMode(.tail)
                            
                            Spacer()
                            Toggle("", isOn: .constant(true)).labelsHidden()
                        }.frame(maxWidth: .infinity).padding(.top)
                        
                        
                        HStack(alignment: .center) {
                            Text("Trending stories")
                                .lineLimit(1)
                                .truncationMode(.tail)
                            
                            Spacer()
                            Toggle("", isOn: .constant(true)).labelsHidden()
                        }.frame(maxWidth: .infinity).padding(.top)
                        
                        
                        
                        HStack(alignment: .center) {
                            Text("Daily or weekly digest")
                                .lineLimit(1)
                                .truncationMode(.tail)
                            
                            Spacer()
                            Toggle("", isOn: .constant(true)).labelsHidden()
                        }.frame(maxWidth: .infinity).padding(.top)
                        
                        
                        
                        HStack(alignment: .center) {
                            Text("Stories from these I follow")
                                .lineLimit(1)
                                .truncationMode(.tail)
                            
                            Spacer()
                            Toggle("", isOn: .constant(true)).labelsHidden()
                        }.frame(maxWidth: .infinity).padding(.top)
                        
                        
                        HStack(alignment: .center) {
                            Text("Someone is following me")
                                .lineLimit(1)
                                .truncationMode(.tail)
                            
                            Spacer()
                            Toggle("", isOn: .constant(true)).labelsHidden()
                        }.frame(maxWidth: .infinity).padding(.top)
                        
                        HStack(alignment: .center) {
                            Text("Someone commented on my story")
                                .lineLimit(1)
                                .truncationMode(.tail)
                            
                            Spacer()
                            Toggle("", isOn: .constant(true)).labelsHidden()
                        }.frame(maxWidth: .infinity).padding(.top)
                        
                        HStack(alignment: .center) {
                            Text("Someone replied to my comment")
                                .lineLimit(1)
                                .truncationMode(.tail)
                            
                            Spacer()
                            Toggle("", isOn: .constant(true)).labelsHidden()
                        }.frame(maxWidth: .infinity).padding(.top)
                        
                    }
                } .scrollIndicators(.hidden).padding(.horizontal)
                
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

struct EnableNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        EnableNotificationView()
    }
}

