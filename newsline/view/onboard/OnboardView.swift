//
//  OnboardView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 13/07/24.
//

import SwiftUI

struct OnboardView: View {
    
    @State private var currentPage = 0
    @State private var onboardContent = OnboardRepository.getOnboardContent()
    @State private var isVisible = true
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                Spacer()
                
                TabView(selection: $currentPage) {
                    
                    ForEach(onboardContent.indices, id: \.self) { index in
                        VStack(alignment: .leading) {
                            
                            Spacer()
                            
                            Text(onboardContent[index].title)
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding(.bottom, 4)
                                .frame(maxWidth: .infinity, alignment: .leading)  // Aligns the title text to the leading edge
                            
                            Text(onboardContent[index].subTitle)
                                .font(.body)
                                .frame(maxWidth: .infinity, alignment: .leading)  // Aligns the subtitle text to the leading edge
                        
                        }
                        .padding(.horizontal)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack(spacing: 8) {
                    ForEach(onboardContent.indices, id: \.self) { index in
                        Circle()
                            .fill(currentPage == index ? primaryColor : Color.gray)
                            .frame(width: 10, height: 10)
                            .animation(.easeInOut, value: currentPage)
                    }
                }
                .padding(.top)
                .padding(.leading, 20)
    
                Divider().padding(.vertical)
                
                HStack(spacing: 16) {
                    
                    if currentPage != (onboardContent.count - 1) {
                        Button(action: { }, label: { Text("Skip").fontWeight(.semibold) })
                            .buttonStyle(OutlinedButtonStyle())
                            .frame(maxWidth: .infinity)
                    }
                    
                    Button(action: { nextPage() },
                                               label: {
                                            if currentPage == (onboardContent.count - 1)  {
                                                NavigationLink(destination: LoginView()) {
                                                    Text("Continue").fontWeight(.semibold)
                                                }
                                            } else { Text("Continue").fontWeight(.semibold) }
                                        })
                                            .buttonStyle(ElevatedButtonStyle())
                                            .frame(maxWidth: .infinity)
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
    }
    
    func nextPage() {
        if (currentPage < (onboardContent.count - 1)) {
            currentPage = currentPage + 1
        }
    }
}



struct OutlinedButtonStyle: ButtonStyle {
    
    @Environment(\.colorScheme) var colorScheme
    
    var outlinedButtonColor: Color {
        colorScheme == .dark ? darkThemeOutlinedButtonColor : lightThemeOutlinedButtonColor
    }
    
    var textColor: Color {
        colorScheme == .dark ? Color.white : primaryColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(outlinedButtonColor)
            .foregroundColor(textColor)
            .cornerRadius(50)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
          
    }
}

struct ElevatedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(elevatedButtonColor)
            .foregroundColor(.white)
            .cornerRadius(50)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
 
struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}
