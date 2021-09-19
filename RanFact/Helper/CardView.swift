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
                .inputResult()
            
            Button(action: shareButton, label: {
                Text("Share")
                Image(systemName: "square.and.arrow.up")
            })
            .displayResult()
        }
    }
    
    func shareButton() {
        let url = URL(string: "https://designcode.io")
        let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}

struct InputResult: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 350, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 50, maxHeight: 100, alignment: .center)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black, lineWidth: 2)
            )
    }
}

struct DisplayResult: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18)).foregroundColor(.black)
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 350, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 200, maxHeight: 250, alignment: .center)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black, lineWidth: 2)
            )
    }
}

extension View {
    func inputResult() -> some View {
        modifier(InputResult())
    }
    
    func displayResult() -> some View {
        modifier(DisplayResult())
    }
}
