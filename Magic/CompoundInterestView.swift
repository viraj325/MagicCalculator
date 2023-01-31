//
//  CompoundInterestView.swift
//  Magic
//
//  Created by Viraj Patel on 1/30/23.
//

import SwiftUI
import Charts

struct CompoundInterestView: View {
    var body: some View {
        Text("Hello, World!")
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
    @Published var initialAmount = 0
    @Published var lengthOfTimeInYears = 1
    @Published var estimatedVarianceRate = 0.0
    
    // Optional Variables
    @Published var monthlyContributions = 0
    @Published var interestRateVarianceRange = 0.0
    @Published var compoundFrequency = Frequency.annually
    
    // Conditional Variables
    @Published var totalContributions = [Int]()
    @Published var futureContributions = [FutureValueObject]()
    @Published var currentContribution = 0
    @Published var showError = false
    
    func calculateCompoundInterest() {
        // Total Contributions
        for i in stride(from: 1, to: lengthOfTimeInYears, by: 1) {
            print("Length of Time Count: \(i)")
            if currentContribution == 0 {
                currentContribution = initialAmount
                totalContributions.append(currentContribution)
            } else {
                currentContribution = currentContribution + (monthlyContributions * 12)
                totalContributions.append(currentContribution)
            }
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
