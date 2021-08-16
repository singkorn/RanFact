//
//  MyDesign.swift
//  MyProject
//
//  Designed in DetailsPro
//  Copyright © (My Organization). All rights reserved.
//

import SwiftUI

struct TestView2: View {
    var body: some View {
//        ScrollView(.vertical, showsIndicators: true) {
        VStack {
            Group {
                Spacer()
                VStack {
                    Text("Title 1")
                    Text("Text 1")
                }
                Spacer()
                VStack {
                    Text("Title 2")
                    Text("Text 2")
                }
                Spacer()
                VStack {
                    Text("Title 3")
                    Text("Text 3")
                }
            }
            Group {
                Spacer()
                VStack {
                    Text("Title 4")
                    Text("Text 4")
                }
                Spacer()
                VStack {
                    Text("Title 5")
                    Text("Text 5")
                }
                Spacer()
                VStack {
                    Text("Title 6")
                    Text("Text 6")
                }
            }
            Group {
                Spacer()
                VStack {
                    Text("Title 7")
                    Text("Text 7")
                }
                Spacer()
                VStack {
                    Text("Title 8")
                    Text("Text 8")
                }
                Spacer()
                VStack {
                    Text("Title 9")
                    Text("Text 9")
                }
            }
            Spacer()
            VStack {
                Text("Title 10")
                Text("Text 10")
            }
            Spacer()
        }
        .background(Color.red)
//        }
    }
}

struct TestView2_Previews: PreviewProvider {
    static var previews: some View {
        TestView2()
    }
}
