//
//  ContentView.swift
//  mem2
//
//  Created by Connor Cochrane on 7/1/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🎃", "👻", "🦇", "🕷️", "🕸️", "🌙", "🧛‍♂️", "🧟‍♂️", "🧙‍♀️", "🍬", "🍭", "🔮"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack{
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120)), ]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
            
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
    struct CardView: View {
        let content: String
        // temp state
        @State var isFacedUp = true
        
       
        var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                }
                .opacity(isFacedUp ? 1 : 0)
                base.fill().opacity(isFacedUp ? 0 : 1)
                
            }
            .onTapGesture {
                isFacedUp.toggle()
            }
        }
    }
    
}






#Preview {
    ContentView()
}

