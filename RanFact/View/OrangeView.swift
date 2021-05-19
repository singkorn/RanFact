//
//  OrangeView.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 16/5/2564 BE.
//

import SwiftUI

struct OrangeView: View {
    
    @State var randomyearfact : RandomYearFact
    
    var body: some View {
        Color.white
            .ignoresSafeArea(.all)
            .overlay(
                VStack(alignment: .leading) {
                    Button(action: {
                        RandomFactViewModel().getJSON { (randomyearfact) in
                            self.randomyearfact = randomyearfact
                        }
                    }) {
                        Text("get JSON")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.blue)
                    
                    VStack {
                        Text(randomyearfact.date)
                        Text(randomyearfact.text)
                        Text(String(randomyearfact.number))
                        Text(String(randomyearfact.found))
                        Text(randomyearfact.type)
                    }
                })
    }
}

struct OrangeView_Previews: PreviewProvider {
    static var previews: some View {
        OrangeView(randomyearfact: RandomYearFact.init(date: "", text: "", number: 0, found: false, type: ""))
    }
}
