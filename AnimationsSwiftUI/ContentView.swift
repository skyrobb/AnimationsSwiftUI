//
//  ContentView.swift
//  AnimationsSwiftUI
//
//  Created by Skyler Robbins on 1/17/25.
//

import SwiftUI

struct ContentView: View {
    @State var didStartGame = false
    @State var fadeIn = false
    @State var fadeOut = false
    @State var buttonDisabled = false
    @State var gameText = ""
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                
                Text(gameText)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .scaleEffect(didStartGame ? 1 : 4)
                    .opacity(fadeIn ? 1 : 0)
                    .opacity(fadeOut ? 0 : 1)
                
                Spacer()
                
                Button("Start Game") {
                    startGame()
                }
                .disabled(buttonDisabled)
            }
        }
    }
    
    func startGame() {
        buttonDisabled = true
        fadeInAndOutAnimationWithNumber("3") {
            fadeInAndOutAnimationWithNumber("2") {
                fadeInAndOutAnimationWithNumber("1") {
                    goTextAnimation() {
                        buttonDisabled = false
                    }
                }
            }
        }
    }
    
    func fadeInAndOutAnimationWithNumber(_ number: String, completion: @escaping () -> Void) {
        gameText = number
        didStartGame = false
        fadeIn = false
        fadeOut = false
        withAnimation(.easeIn(duration: 0.3)) {
            didStartGame = true
            fadeIn = true
        } completion: {
            withAnimation(.easeOut(duration: 0.2)) {
                fadeOut = true
            } completion: {
                completion()
            }
        }
    }
    
    func goTextAnimation(completion: @escaping () -> Void) {
        gameText = "Go!"
        didStartGame = false
        fadeIn = false
        fadeOut = false
        withAnimation(.easeIn(duration: 0.3)) {
            didStartGame = true
            fadeIn = true
        } completion: {
            completion()
        }
    }
}


#Preview {
    ContentView()
}
