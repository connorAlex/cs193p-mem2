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
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundColor(.orange)
    }
    
    struct CardView: View {
        var isFacedUp: Bool = false
       
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
                
                Text("👻")
            }
        }
    }
    
}






#Preview {
    ContentView()
}

