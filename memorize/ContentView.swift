//
//  ContentView.swift
//  memorize
//
//  Created by 11127242 on 2026/3/16.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
        }
        
        .padding()
        .foregroundStyle(.orange)
    }
}

struct CardView: View {
    var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            if (isFaceUp) {
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 3)
                Text("🛜")
                    .foregroundStyle(.blue)
            } else {
                RoundedRectangle(cornerRadius: 20)
            }
            
        }
    }
}
#Preview {
    ContentView()
}
