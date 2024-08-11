//
//  CompleteView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 01/08/24.
//

import Foundation
import SwiftUI

struct CompleteView: View {

    @State private var text: String = ""
    
    @Environment(\.presentationMode) var presentationMode


    var body: some View {
        
        VStack(alignment: .center, spacing: 20.0) {
            
            Spacer()
            
            Image(systemName: "checkmark")
                           .resizable()
                           .aspectRatio(contentMode: .fill)
                           .frame(width: 30, height: 30)
                           .padding(20)
                           .foregroundColor(.white)
                           .background(
                               Circle()
                                .fill(primaryColor)
                           )
                           .frame(maxWidth: .infinity, alignment: .center)
            
            Text("You're All Set!")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal)
                .padding(.top)
            
            Text("Start exploring, discovering and engaging with the news.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
        
            Spacer()
            
            Divider()
                .padding([.leading, .trailing])
            
            HStack {
               
                Button(
                    action: { },
                    label: {
                        NavigationLink(destination: HomeApp()) {
                            Text("Le's Go").fontWeight(.semibold)
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

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView()
    }
}



