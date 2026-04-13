//
//  ContentView.swift
//  memorize
//
//  Created by 11127242 on 2026/3/16.
//

import SwiftUI

struct ContentView: View {  // main()
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack{  // vertical stack
            cardlist
                .animation(.default, value: viewModel.cards)
            Spacer()
            Button("Shuffle") {
                viewModel.shuffle()
            }
            .font(.largeTitle)
        }
        .padding()
        .foregroundStyle(.orange)
    }  // var body
    
    var cardlist: some View {
        ScrollView {
            // Lazy: 節省資源，顯示時才載入
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 0)], spacing: 0) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)  // 呼叫自定義的卡片視圖
                        .aspectRatio(2/3, contentMode: .fit)  // 強制卡片比例為 2:3 (寬:高)
                        .padding(4)  // 每張卡片外圍留 4 單位的空白，避免擠在一起
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }  // ForEacgh
            }  // LazyVGrid
        }  // ScrollView
        
    }  // var cardlist
    
}  // ContentView


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            Group {
                shape.fill(Color.white)  // 卡片底色白色
                shape.strokeBorder(lineWidth: 3)  // 邊框厚度3
                Text(card.content)
                    .font(Font.system(size: 300))  // 設定卡中文字
                    .minimumScaleFactor(0.1)  // 允許文字縮小到原本的 1%，以適應卡片大小
                    .aspectRatio(1, contentMode: .fit)  // 讓文字保持 1:1 正方形比例並填滿空間
            }
            .opacity(card.isFaceUp ? 1 : 0)
            
            shape.opacity(card.isFaceUp ? 0 : 1)
            
        }  // ZStack
        .opacity(card.isMatched && !card.isFaceUp ? 0 : 1)
    }
}
#Preview {
    ContentView(viewModel:  EmojiMemoryGame())
}

