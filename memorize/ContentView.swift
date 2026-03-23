//
//  ContentView.swift
//  memorize
//
//  Created by 11127242 on 2026/3/16.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    @State var emojiCount = 5
    
    var body: some View {
        VStack{  // vertical stack
            HStack {  // horizontal stack
                ForEach(emojis[0..<emojiCount], id:\.self) { emoji in
                    CardView(content: emoji)
                }
            }
            HStack {
                Button(action: {
                    emojiCount -= 1
                }, label: {
                    Text("Remove Card")
                })
                
                Spacer()
                
                Button(action: {
                    emojiCount += 1
                }, label: {
                    Text("Add Card")
                })
            }
        }
        .padding()
        .foregroundStyle(.orange)
    }
}


struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if (isFaceUp) {
                shape.fill(Color.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape
            }
            
        }
        .onTapGesture {
                isFaceUp = !isFaceUp
        }
    }
}
#Preview {
    ContentView()
}
