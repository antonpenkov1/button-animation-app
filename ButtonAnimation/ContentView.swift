//
//  ContentView.swift
//  ButtonAnimation
//
//  Created by Антон Пеньков on 31.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isPressed = false
    @State private var counter = 0
    
    var body: some View {
        VStack {
            Text("\(counter)")
                .font(.system(size: 60, weight: .bold))
                .opacity(isPressed ? 0.6 : 1)
                .scaleEffect(isPressed ? 1.5 : 1)
            
            ZStack {
                Capsule()
                    .frame(width: 150, height: 50)
                    .foregroundColor(.blue)
                
                Text("Tap me")
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
            }
            .opacity(isPressed ? 0.6 : 1)
            .scaleEffect(isPressed ? 1.3 : 1)
            .onTapGesture {
                counter += 1
            }
            .pressEvents {
                withAnimation(.easeIn(duration: 0.1)) {
                    isPressed = true
                }
            } onRelease: {
                withAnimation {
                    isPressed = false
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
