//
//  YearView.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 11/5/2564 BE.
//

import SwiftUI

struct YearView: View {
    
    @ObservedObject var viewModel = RandomFactViewModel()
    @State private var name: String = ""
    @State private var selectorIndex = 0
    @State private var selectedRandomType = "year"
    @State private var year = Calendar.current.component(.year, from: Date())
    @State private var selectedYear: Int = 2020
    var randomTypes = ["year", "trivia", "random", "math", "date"]
    
    var body: some View {
                
        VStack {
            Text("🗓 Year 🗓")
                .font(.system(size: 48))
            
            Spacer()
                .frame(height: 50)
            
            VStack {
                Picker("Select Year: ", selection: $selectedYear) {
                    ForEach(1..<Int(year)+1) {
                        Text(String($0))
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            VStack {
                Group {
                    let str1 = "On \(self.viewModel.randomFactItem.date ?? "the date 📆 that I do not remember in ") \(self.viewModel.randomFactItem.number ?? 0)"
                    let str2 = "\(self.viewModel.randomFactItem.text ?? "from the far away paralell universe")"
                    Text(str1)
                    Text(str2)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
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
                    print("Typed Text: \(String(selectedYear+1))")
                    print("Selected Random Type: \(selectedRandomType)")
                    viewModel.fetchData(selectedRandomNumber: String(selectedYear+1), selectedRandomType: selectedRandomType)
                }) {
                    HStack {
                        Image(systemName: "magnifyingglass.circle.fill")
                        Text("Open ChocBox")
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
        .padding()
        .onTapGesture {
            self.hideKeyboard()
        }
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

struct YearView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            YearView()
        }
    }
}
