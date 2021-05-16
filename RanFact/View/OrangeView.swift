//
//  OrangeView.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 16/5/2564 BE.
//

import SwiftUI

struct OrangeView: View {
    
//    @State private var counter : Int = 0
    
    var body: some View {
        Color.orange
            .ignoresSafeArea(.all)
            .overlay(
                VStack(alignment: .leading) {
//                    Button(action: {
//                        self.counter += 1
//                    }) {
//                        Text("Add")
//                            .foregroundColor(.white)
//                    }
//                    .padding()
//                    .background(Color.blue)
//
//                    Text("\(counter)")
//                        .padding()
                    Button(action: {
                        RandomFactViewModel().getJSON()
                    }) {
                        Text("get JSON")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.blue)
                    
                    Text("Hello")
                })
    }
}

struct OrangeView_Previews: PreviewProvider {
    static var previews: some View {
        OrangeView()
    }
}
