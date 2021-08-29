//
//  RandomView.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 16/5/2564 BE.
//

import SwiftUI

struct RandomView: View {
    
    @ObservedObject var viewModel = RandomFactViewModel()
    @State private var name: String = ""
    @State private var selectorIndex = 0
    @State private var selectedRandomType = "random"
    
    var randomTypes = ["year", "trivia", "random", "math", "date"]
    
    var body: some View {
        
        VStack {
            Text("∞ Random ∞")
                .font(.system(size: 48))
            
            Spacer()
                .frame(height: 50)
            
            ZStack {
                Circle()
                    .fill(Color("color.wildcaribbeangreen"))
                    .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2.0)
                    .shadow(color: Color.pink.opacity(0.3), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10.0)
                Text(String(viewModel.randomFactItem.number ?? 0))
                    .font(.largeTitle)
            }
            
            Spacer()
                .frame(height: 25)
            
            VStack(alignment: .leading) {
                Group {
                    Text(self.viewModel.randomFactItem.text ?? "Text Unknown")
                }
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                    print("Typed Text: \(name)")
                    print("Selected Random Type: \(selectedRandomType)")
                    viewModel.fetchData(selectedRandomNumber: name, selectedRandomType: selectedRandomType)
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

struct OrangeView_Previews: PreviewProvider {
    static var previews: some View {
        RandomView()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
