//
//  DateView.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 27/6/2564 BE.
//

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
            Text("📆 Date 📅")
                .font(.system(size: 48))
            
            Spacer()
                .frame(height: 50)
            
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    Text("Day")
                        .clipped()
                        .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .border(Color.red)
                    Text("/")
                    Text("Month")
                        .clipped()
                        .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .border(Color.blue)
                }
                HStack {
                    Picker("Day", selection: $selectedDay) {
                        ForEach(1..<day) {
                            Text("\($0)")
                        }
                    }
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipped()
                    .border(Color.red)
                    
                    Picker("Month", selection: $selectedMonth) {
                        ForEach(1..<month) {
                            Text("\($0)")
                        }
                    }
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipped()
                    .border(Color.blue)
                }
//                selectedDate = String("\(selectedMonth+1)/\(selectedDay+1)")
//                Text("\(selectedDay+1)/\(selectedMonth+1)")
//                    .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
                    
            VStack(alignment: .leading) {
                Group {
                    Text(viewModel.randomFactItem.text ?? "Text Unknown")
                    Text(String(viewModel.randomFactItem.year ?? 0))
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 10)
                .font(.system(size: 18).bold())
                
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
            
            Button(action: shareButton, label: {
                Text("💞 Share 📦")
                Image(systemName: "square.and.arrow.up")
            })
            
            Spacer()
                .frame(height: 20)

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
                            .padding(.horizontal)
                    }
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color("color.cyanite"))
                .cornerRadius(8.0)
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
        let sharedText: String = viewModel.randomFactItem.text ?? "Randomized by ChocBox"
        let activityController = UIActivityViewController(activityItems: [sharedText + " #ChocBox"], applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}

