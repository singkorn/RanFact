//
//  TestView.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 15/7/2564 BE.
//

import SwiftUI

struct TestView: View {
    
    var alertText = "Something went wrong!"
    
    var body: some View {
        Text(alertText)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(15)
                    .shadow(color: Color("alertShadow"), radius: 5, x: 1, y: 1)
                    .foregroundColor(Color("alertText"))
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TestView().preferredColorScheme(.light)
            TestView().preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
    
}
