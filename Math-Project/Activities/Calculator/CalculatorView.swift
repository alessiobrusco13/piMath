//
//  CalculatorView.swift
//  Math-Project
//
//  Created by Alessio Garzia Marotta Brusco on 30/10/2021.
//

import SwiftUI

struct CalculatorView: View {
    @StateObject private var calculator = Calculator()
    @State private var disabled = false

    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .trailing) {
                ZStack(alignment: .trailing) {
                    ResultView(calculator: calculator)
                        .padding()

                    OperationView(calculator: calculator)
                    //                    FractionView(rational: Rational(approximating: 0.75))
                        .padding(.horizontal)
                        .offset(y: -80)
                }

                Spacer()

                ForEach(calculator.buttons) { row in
                    HStack {
                        ForEach(row) { button in
                            button
                                .buttonStyle(.squishable(fadeOnPress: false))
                                .disabled(
                                    button.type == .standard
                                    ? disabled
                                    : false
                                )
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom)
            .onAppear { calculator.proxy = proxy }
        }
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                ButtonToggle(isOn: $calculator.fractionResults) {
                    Text("\u{00BE}")
                        .font(.title3)
                }
            }
        }
    }
}
