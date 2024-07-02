//
//  ContentView.swift
//  mem2
//
//  Created by Connor Cochrane on 7/1/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻","💀","🕷️","🎃"]
    
    var body: some View {
        HStack {
            ForEach(0..<4, id: \.self){ index in
                CardView(content: emojis[index])
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
    
    struct CardView: View {
        let content: String
        // temp state
        @State var isFacedUp = false
        
       
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

