//
//  PaycheckCalculatorUI.swift
//  Magic
//
//  Created by Viraj Patel on 9/30/23.
//

import SwiftUI

struct PaycheckCalculatorView: View {
    var body: some View {
        WebView(url: URL(string: "https://smartasset.com/taxes/paycheck-calculator")!)
    }
}

struct OptionsCalculatorView: View {
    var newURL = "https://www.marketbeat.com/calculators/options-profit-calculator/"
    var oldURL = "https://www.optionsprofitcalculator.com/calculator/long-call.html"
    
    var body: some View {
        WebView(url: URL(string: newURL)!)
    }
}

struct DilutionCalculatorView: View {
    var url = "https://www.capboard.io/en/captable/equity-dilution-calculator"
    
    var body: some View {
        WebView(url: URL(string: url)!)
    }
}
