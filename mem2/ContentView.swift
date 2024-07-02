//
//  ContentView.swift
//  mem2
//
//  Created by Connor Cochrane on 7/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFacedUp: true)
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundColor(.orange)
    }
    
    struct CardView: View {
        // temp state
        @State var isFacedUp = false
       
        var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                if isFacedUp {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text("👻").font(.largeTitle)
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

