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
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 300, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 50, maxHeight: 100, alignment: .topLeading)
//            .background(LinearGradient(gradient: Gradient(colors: [Color("woollyColor1"), Color("woollyColor2")]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .background(Color("color.megaman"))
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2.0)
            .shadow(color: Color.pink.opacity(0.3), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10.0)
    }
}

struct DisplayResult: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18)).foregroundColor(.white)
            .foregroundColor(.white)
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 300, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 300, maxHeight: 300, alignment: .center)
//            .background(LinearGradient(gradient: Gradient(colors: [Color("woollyColor5"), Color("woollyColor6")]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .background(Color("color.pastelred"))
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2.0)
            .shadow(color: Color.pink.opacity(0.3), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10.0)
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
