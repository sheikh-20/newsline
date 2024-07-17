//
//  SplashView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 17/07/24.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if (self.isActive) {
                HomeApp()
            } else {
                Rectangle().foregroundColor(Color.black).ignoresSafeArea()
                
                VStack(alignment: .center) {
                    
                    Image("Newsline")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                    
                    Text("Newsline")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.white)
                        .padding()
                }
                
                CustomCircularLoadingView(lineWidth: 8, color: Color(hex: 0xFF147a72), size: 50)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .padding(.bottom, 50)
                }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.3) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}



struct CustomCircularLoadingView: View {
    @State private var isAnimating = false
    var lineWidth: CGFloat = 5
    var color: Color = Color(red: 20/255, green: 122/255, blue: 114/255)
    var size: CGFloat = 30
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.7)
            .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            .foregroundColor(.clear)
            .frame(width: size, height: size)
            .overlay(
                Circle()
                    .trim(from: 0.3, to: 1.0)
                    .stroke(AngularGradient(gradient: Gradient(colors: [
                        color.opacity(0), color
                    ]), center: .center, startAngle: .degrees(0), endAngle: .degrees(270)), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .frame(width: size, height: size)
            )
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .animation(
                Animation.linear(duration: 1)
                    .repeatForever(autoreverses: false)
            )
            .onAppear {
                self.isAnimating = true
            }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

