//
//  TriviaView.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 27/6/2564 BE.
//

import SwiftUI

struct TriviaView: View {
    
    @ObservedObject var viewModel = RandomFactViewModel()
    @State private var name: String = ""
    @State private var selectorIndex = 0
    @State private var selectedRandomType = "trivia"
    @State private var triviaNum = ""
    
    var randomTypes = ["year", "trivia", "random", "math", "date"]
    
    var body: some View {
        
        VStack(alignment: .center) {
            HStack {
                Image(systemName: "graduationcap")
                    .font(.system(size: 48))
                Text( "Trivia")
                    .font(.system(size: 48))
            }
            
            Spacer()
                .frame(height: 50)
            
            VStack(alignment: .center) {
                TextField("What's the number?", text: $triviaNum)
                    .padding()
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 23).bold())
            }
            .inputResult()
            
            Spacer()
                .frame(height: 20)
            
            VStack(alignment: .leading) {
                Group {
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
                        print("Typed Text: \(triviaNum)")
                        print("Selected Random Type: \(selectedRandomType)")
                        viewModel.fetchData(selectedRandomNumber: triviaNum, selectedRandomType: selectedRandomType)
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
        let sharedText: String = "\(triviaNum) \(viewModel.randomFactItem.text ?? "Randomized by TauLake")"
        let activityController = UIActivityViewController(activityItems: [sharedText + " #TauLake"], applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
       TriviaView()
        .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
        .previewDisplayName("iPhone 8")
    }
}
