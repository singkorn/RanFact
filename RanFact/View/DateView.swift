//
//  DateView.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 27/6/2564 BE.
//
import Foundation
import SwiftUI

struct DateView: View {
    
    @ObservedObject var viewModel = RandomFactViewModel()
    @State private var selectorIndex = 0
    @State private var selectedRandomType = "date"
    @State private var day: Int = 32
    @State private var month: Int = 13
    @State private var selectedDate: String = "9/2"
    @State private var selectedDay: Int = 15
    @State private var selectedMonth: Int = 7
    
    var randomTypes = ["year", "trivia", "random", "math", "date"]
    
    var body: some View {
        
        VStack {
            HStack {
                Image(systemName: "text.book.closed")
                    .font(.system(size: 48))
                Text( "Date")
                    .font(.system(size: 48))
            }
            
            Spacer()
                .frame(height: 20)
            
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    Text("Day")
                        .bold()
                        .clipped()
                        .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    Text("/")
                    Text("Month")
                        .bold()
                        .clipped()
                        .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
                HStack {
                    Picker("Day", selection: $selectedDay) {
                        ForEach(1..<day) {
                            Text("\($0)")
                        }
                    }
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipped()
                    
                    Picker("Month", selection: $selectedMonth) {
                        ForEach(1..<month) {
                            Text("\($0)")
                        }
                    }
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipped()
                }

            }
                        
            VStack(alignment: .leading) {
                Group {
                    Text("Year: \(String(viewModel.randomFactItem.year ?? 1492))")
                    let str = "\"" + (viewModel.randomFactItem.text  ?? "Sometimes, the universe is taking too long to answer...") + "\""
                    Text(str)
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 10)
                .font(.system(size: 21).bold())

                Print(viewModel.randomFactItem.date ?? "Date Unknown")
                Print(viewModel.randomFactItem.text ?? "Text Unknown")
                Print(String(viewModel.randomFactItem.year ?? 0))
                Print(String(viewModel.randomFactItem.number ?? 0))
                Print(String(viewModel.randomFactItem.found ?? false))
                Print(viewModel.randomFactItem.type ?? "Type Unknown")
            }
            .displayResult()
                        
            Spacer()
                .frame(height: 20)
            
            HStack {
                Button(action: shareButton, label: {
                    Image(systemName: "square.and.arrow.up.fill")
                    Text("Share")
                })
                .padding()
                .foregroundColor(Color.white)
                .background(Color("color.joustblue"))
                .cornerRadius(8.0)

                VStack {
                    Button(action: {
                        print("Button Pressed...")
                        print("Typed Text: \(String("\(selectedMonth+1)/\(selectedDay+1)"))")
                        print("Selected Random Type: \(selectedRandomType)")
                        viewModel.fetchData(selectedRandomNumber: String("\(selectedMonth+1)/\(selectedDay+1)"), selectedRandomType: selectedRandomType)
                    }) {
                        HStack {
                            Image(systemName: "magnifyingglass.circle.fill")
                            Text("Search")
                        }
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color("color.darkmetalmeadow"))
                    .cornerRadius(8.0)
                }
            }
            
        }.onAppear(perform: {
            viewModel.fetchData()
        })
        .onTapGesture {
            self.hideKeyboard()
        }
        .padding(.all, 20)
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 200, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
        .background(Color("color.casandorayellow")).ignoresSafeArea(.all)
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
    
    func shareButton() {
        let sharedText: String = "\(selectedDay+1)/\(selectedMonth+1)/\(viewModel.randomFactItem.year ?? 1492) \(viewModel.randomFactItem.text ?? "Randomized by TauLake")"
        let activityController = UIActivityViewController(activityItems: [sharedText + " #TauLake   "], applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
    
    func showDate() -> some View {
        let dateString = "02/09/1976"
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd/MM/yyyy"

        return Text(dateFormatter.string(from: dateFormatter.date(from: dateString) ?? Date()))
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
    }
}

