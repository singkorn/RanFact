//
//  TestView.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 15/7/2564 BE.
//

import SwiftUI

struct TestView: View {
        
    @State private var num = ""
    @State var selectedDate = Date()
    @State private var selectedDay = 15
    @State private var selectedMonth = 7
    private var circleColor = Color(UIColor.systemGray)

    var body: some View {
        VStack {
            
            ZStack {
              Circle()
                .stroke(Color("woollyColor3"), lineWidth: 4)

              Text("13")
            }
            .frame(width: 100, height: 100)
            
            HStack(alignment: .center) {
                Text("Day")
                    .clipped()
                    .border(Color.red)
                Text("/")
                Text("Month")
                    .clipped()
                    .border(Color.blue)
            }
            HStack {
                Picker("Day", selection: $selectedDay) {
                    ForEach(1..<32) {
                        Text("\($0)")
                    }
                }
                .frame(maxWidth: 100)
                .clipped()
                .border(Color.red)
                
                Picker("Month", selection: $selectedMonth) {
                    ForEach(1..<13) {
                        Text("\($0)")
                    }
                }
                .frame(maxWidth: 100)
                .clipped()
                .border(Color.blue)
            }
            
            DatePicker("", selection: $selectedDate, displayedComponents: .date)
            Text("Your selected date: \(selectedDate)")
            
            Text(DateFormatter.displayDate.string(from: selectedDate))
            
            TextField("Input Number", text: $num)
                .padding()
                .keyboardType(.numberPad)

            Text("Your number is \(num).")
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView().preferredColorScheme(.light)
//        Group {
//            TestView().preferredColorScheme(.light)
//            TestView().preferredColorScheme(.dark)
//        }
//        .previewLayout(.sizeThatFits)
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
    
}

extension DateFormatter {
    static let displayDate: DateFormatter = {
         let formatter = DateFormatter()
         formatter.dateFormat = "EEEE, MMMM dd"
         return formatter
    }()
}
