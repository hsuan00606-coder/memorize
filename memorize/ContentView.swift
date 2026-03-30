//
//  ContentView.swift
//  memorize
//
//  Created by 11127242 on 2026/3/16.
//

import SwiftUI

struct ContentView: View {  // main()
    var emojis = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y"]
    @State var emojiCount = 9
    
    var body: some View {
        VStack{  // vertical stack
            cardlist
            Spacer()
            actions
        }
        .padding()
        .foregroundStyle(.orange)
    }
    
    var actions: some View {
        HStack {
            remove
            Spacer()
            add
        }
        .font(.largeTitle)
    }  // actions
    
    var cardlist: some View {
        ScrollView {
            // Lazy: 節省資源，顯示時才載入
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 0)], spacing: 0) {
                ForEach(emojis[0..<emojiCount], id:\.self) { emoji in
                    CardView(content: emoji)  // 呼叫自定義的卡片視圖
                        .aspectRatio(2/3, contentMode: .fit)  // 強制卡片比例為 2:3 (寬:高)
                        .padding(4)  // 每張卡片外圍留 4 單位的空白，避免擠在一起
                }  // ForEacgh
            }  // LazyVGrid
        }  // ScrollView
        
    }  // cardlist
    
    // remove button
    var remove: some View {
        Button {
            if (emojiCount > 1) {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    // add button
    var add: some View {
        Button {
            if (emojiCount < emojis.count) {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}


struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            Group {
                shape.fill(Color.white)  // 卡片底色白色
                shape.strokeBorder(lineWidth: 3)  // 邊框厚度3
                Text(content)
                    .font(Font.system(size: 300))  // 設定卡中文字
                    .minimumScaleFactor(0.1)  // 允許文字縮小到原本的 1%，以適應卡片大小
                    .aspectRatio(1, contentMode: .fit)  // 讓文字保持 1:1 正方形比例並填滿空間
            }
            .opacity(isFaceUp ? 1 : 0)
            
            shape.opacity(isFaceUp ? 0 : 1)
            
        }  // ZStack
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
#Preview {
    ContentView()
}

