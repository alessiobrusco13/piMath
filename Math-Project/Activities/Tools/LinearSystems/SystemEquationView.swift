//
//  SystemEquationView.swift
//  SystemEquationView
//
//  Created by Alessio Garzia Marotta Brusco on 31/08/2021.
//

import SwiftUI

struct SystemEquationView: View {
    @Binding var equation: LinearSystem.Equation

    var body: some View {
        Text(" \(equation.formatted()) ")
            .font(.equation)
    }

    init(equation: Binding<LinearSystem.Equation>) {
        self._equation = equation
    }

    init(equation: LinearSystem.Equation) {
        self.init(equation: .constant(equation))
    }
}

struct SystemEquationView_Previews: PreviewProvider {
    static var previews: some View {
        SystemEquationView(equation: .example)
    }
}
