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
