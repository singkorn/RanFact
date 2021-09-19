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
            HStack {
                Image(systemName: "calendar")
                    .font(.system(size: 48))
                Text( "Year")
                    .font(.system(size: 48))
            }
            
            Spacer()
                .frame(height: 40)
            
            VStack {
                Picker("Select Year: ", selection: $selectedYear) {
                    ForEach(1..<Int(year)+1) {
                        Text(String($0))
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            .frame(width: 350, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Spacer()
                .frame(height: 40)
            
            VStack {
                Group {
                    let str1 = "On \(self.viewModel.randomFactItem.date ?? "the date 📆 which the universe has not mentioned in ") \(self.viewModel.randomFactItem.number ?? 0)"
                    let str2 = "\(self.viewModel.randomFactItem.text ?? "from the far away paralell universe")"
                    
                    Text(str1)
                    Text("\"" + str2 + "\"")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 21).bold())
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 10)
                .font(.system(size: 18))
                
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
                        print("Typed Text: \(String(selectedYear+1))")
                        print("Selected Random Type: \(selectedRandomType)")
                        viewModel.fetchData(selectedRandomNumber: String(selectedYear+1), selectedRandomType: selectedRandomType)
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
        let sharedText: String = "\(viewModel.randomFactItem.date ?? "the date 📆 which the universe has not mentioned in ") \(selectedYear+1) \(viewModel.randomFactItem.text ?? "Randomized by TauLake")"
        let activityController = UIActivityViewController(activityItems: [sharedText + " #TauLake"], applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
}

struct YearView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            YearView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
        }
    }
}
