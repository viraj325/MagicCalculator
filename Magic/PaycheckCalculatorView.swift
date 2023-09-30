//
//  PaycheckCalculatorUI.swift
//  Magic
//
//  Created by Viraj Patel on 9/30/23.
//

import SwiftUI

struct PaycheckCalculatorView: View {
    var body: some View {
        WebView(url: URL(string: "https://www.adp.com/resources/tools/calculators/salary-paycheck-calculator.aspx")!)
            .ignoresSafeArea()
            .navigationTitle("ADP Paycheck Calculator")
            .navigationBarTitleDisplayMode(.inline)
    }
}
