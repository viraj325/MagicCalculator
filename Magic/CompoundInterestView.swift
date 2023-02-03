//
//  CompoundInterestView.swift
//  Magic
//
//  Created by Viraj Patel on 1/30/23.
//

import SwiftUI
import Charts

struct CompoundInterestView: View {
    @ObservedObject var functions = CompoundInterestFunctions()

    var body: some View {
        VStack {
            Text("Hello, World!")
            TextField("Initial Investment", text: $functions.initialAmount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Monthly Contribution", text: $functions.monthlyContributions)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Length of Time in Years", text: $functions.lengthOfTimeInYears)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Estimated Interest Rate", text: $functions.estimatedVarianceRate)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Interest rate variance range", text: $functions.interestRateVarianceRange)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            //need compound frequency
            Button(action: {
                print("Button Clicked")
                functions.calculateCompoundInterest()
                functions.printForTesting()
            }) {
                Text("Calculate")
            }
        }
        .padding()
    }
}

struct CompoundInterestView_Previews: PreviewProvider {
    static var previews: some View {
        CompoundInterestView()
    }
}


class CompoundInterestFunctions: ObservableObject {
    enum Frequency : Int {
        case annually = 1
        case semiAnnually = 2
        case quarterly = 4
        case monthly = 12
        case daily = 365
    }
    
    // Required Variables
    @Published var initialAmount = "0"
    @Published var lengthOfTimeInYears = "1"
    @Published var estimatedVarianceRate = "0.0"
    
    // Optional Variables
    @Published var monthlyContributions = "0"
    @Published var interestRateVarianceRange = "0.0"
    @Published var compoundFrequency = Frequency.annually
    
    // Conditional Variables
    @Published var totalContributions = [Int]()
    @Published var futureContributions = [FutureValueObject]()
    @Published var currentContribution = 0
    @Published var showError = false
    
    func calculateCompoundInterest() {
        // Total Contributions
        for i in stride(from: 1, to: Int(lengthOfTimeInYears)! + 1, by: 1) {
            print("Length of Time Count: \(i)")
            if currentContribution == 0 {
                currentContribution = Int(initialAmount)!
                totalContributions.append(currentContribution)
            } else {
                currentContribution = currentContribution + (Int(monthlyContributions)! * 12)
                totalContributions.append(currentContribution)
            }
        }
    }
    
    func printForTesting() {
        for i in totalContributions {
            print("Total Contributions: \(i)")
        }
    }
}

class FutureValueObject: Identifiable {
    var id = UUID().uuidString
    var lowerVariance: Int
    var currentVariance: Int
    var higherVariance: Int
    
    init(lowerVariance: Int, currentVariance: Int, higherVariance: Int) {
        self.lowerVariance = lowerVariance
        self.currentVariance = currentVariance
        self.higherVariance = higherVariance
    }
}
