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
    @Published var lengthOfTimeInYears = 0
    @Published var estimatedVarianceRate = 0.0
    
    // Optional Variables
    @Published var monthlyContributions = 0
    @Published var interestRateVarianceRange = 0.0
    @Published var compoundFrequency = Frequency.annually
    
    func calculateCompoundInterest() {
        
    }
}
