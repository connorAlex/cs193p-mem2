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
            HStack {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
            .foregroundColor(.orange)
            
            HStack {
                Button(action: {
                    if cardCount > 1 {
                        cardCount -= 1
                    }
                    
                }, label: {
                    Image(systemName: "rectangle.stack.fill.badge.minus")
                })
                Spacer()
                Button(action: {
                    if cardCount < emojis.count {
                        cardCount += 1
                    }
                }, label: {
                    Image(systemName: "rectangle.stack.fill.badge.plus")
                })
            }
            .imageScale(.large)
            .font(.largeTitle)
        }
        .padding()
    }
    
    struct CardView: View {
        let content: String
        // temp state
        @State var isFacedUp = true
        
       
        var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                if isFacedUp {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                } else {
                    base
                }
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

