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
            
            TextField("Estimated Interest Rate", text: $functions.estimatedVarianceRate) // convert this to decimal so ex) 20.0 -> .2
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Interest rate variance range", text: $functions.interestRateVarianceRange) // convert this to decimal so ex) 20.0 -> .2
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            //need compound frequency
            Button(action: {
                print("Button Clicked")
                functions.calculateTotal()
                functions.printForTesting()
            }) {
                Text("Calculate")
            }
        }
        .padding()
        .onAppear {
            URLFunctions.getUnemploymentRate()
        }
    }
}

struct CompoundInterestView_Previews: PreviewProvider {
    static var previews: some View {
        CompoundInterestView()
    }
}


class CompoundInterestFunctions: ObservableObject {
    enum Frequency : Double {
        case annually = 1.0
        case semiAnnually = 2.0
        case quarterly = 4.0
        case monthly = 12.0
        case daily = 365.0
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
    @Published var test = [Double]()
    @Published var futureContributions = [FutureValueObject]()
    @Published var currentContribution = 0
    @Published var showError = false
    
    func calculateTotal() {
        // Total Contributions
        for i in stride(from: 0, to: Int(lengthOfTimeInYears)! + 1, by: 1) {
            print("Length of Time Count: \(i)")
            if currentContribution == 0 {
                currentContribution = Int(initialAmount)!
                totalContributions.append(currentContribution)
                test.append(calculateCompoundInterest(principal: Double(currentContribution), contributions: Double(monthlyContributions)!, interestRate: convertRateFromWholeToDouble(rate: estimatedVarianceRate), compoundRate: compoundFrequency.rawValue, years: Double(i)))
            } else {
                currentContribution = currentContribution + (Int(monthlyContributions)! * 12)
                totalContributions.append(currentContribution)
                test.append(calculateCompoundInterest(principal: Double(currentContribution), contributions: Double(monthlyContributions)!, interestRate: convertRateFromWholeToDouble(rate: estimatedVarianceRate), compoundRate: compoundFrequency.rawValue, years: Double(i)))
            }
        }
    }
    
    func convertRateFromWholeToDouble(rate: String) -> Double {
        let tempConvertedValue = Double(rate)!
        let tempDecimalValue = tempConvertedValue / 100.0
        print(tempDecimalValue)
        return tempDecimalValue
    }
    
    func calculateCompoundInterest(principal: Double, contributions: Double, interestRate: Double, compoundRate: Double, years: Double) -> Double {
        let totalRateCalculation = interestRate / compoundRate
        let compoundInterestFormula = principal * (1 + pow(totalRateCalculation, (compoundRate * years)))
        let monthlyContributionFormula = (contributions * (1 + pow(totalRateCalculation, (compoundRate * years))) - 1) / (totalRateCalculation)
        let total = compoundInterestFormula + monthlyContributionFormula
        return Double(compoundInterestFormula)
    }
    
    func printForTesting() {
        for i in totalContributions {
            print("Total Contributions: \(i)")
        }
        
        for a in test {
            print("Future Contributions: \(a)")
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
