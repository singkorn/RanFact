//
//  CardView.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 12/7/2564 BE.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.title).bold()
                .foregroundColor(.white)
                .shadow(radius: 20)
        }
        .frame(width: 300, height: 400)
        .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2.0)
        .shadow(color: Color.pink.opacity(0.3), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10.0)
        
        Link("Design+Code",
              destination: URL(string: "https://designcode.io")!)
                    .font(.title)
                    .foregroundColor(.purple)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
