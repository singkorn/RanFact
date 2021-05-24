//
//  OrangeView.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 16/5/2564 BE.
//

import SwiftUI

struct OrangeView: View {
    
    @ObservedObject var viewModel = SwiftUIViewMVVMViewModel()

    var body: some View {
        VStack {
                VStack(alignment: .leading) {
                    Text(viewModel.randomFactItem.date ?? "Date Unknown")
                    Text(viewModel.randomFactItem.text ?? "default text")
                    Text(String(viewModel.randomFactItem.number ?? 0))
                    Text(String(viewModel.randomFactItem.found ?? true))
                    Text(viewModel.randomFactItem.type ?? "default type")

                    Print(viewModel.randomFactItem.date ?? "Date Unknown")
                    Print(viewModel.randomFactItem.text ?? "default text")
                    Print(String(viewModel.randomFactItem.number ?? 0))
                    Print(String(viewModel.randomFactItem.found ?? true))
                    Print(viewModel.randomFactItem.type ?? "default type")
                }
            }.onAppear(perform: {
            viewModel.fetchData()
        })
    }
}

struct OrangeView_Previews: PreviewProvider {
    static var previews: some View {
        OrangeView()
    }
}
