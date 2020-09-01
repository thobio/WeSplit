//
//  ContentView.swift
//  WeSplit
//
//  Created by Zerone Consulting on 01/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPrecentage = 2
    let tipPrecentages = [10,15,20,25,0]
    
    var totalPerson:Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPrecentages[tipPrecentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        return (orderAmount + tipValue) / peopleCount
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text: $checkAmount)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("How much tip you want to leave")){
                    Picker("Tip precentage", selection: $tipPrecentage) {
                        ForEach(0..<tipPrecentages.count){
                            Text("\(tipPrecentages[$0]) %")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    Text("$ \(totalPerson , specifier: "%.2f")")
                }
            }
            .navigationTitle("We Split")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           ContentView()
        }
    }
}
