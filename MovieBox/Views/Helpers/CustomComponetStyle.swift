//
//  TextFieldView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-29.
//

import SwiftUI

struct MBTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .disableAutocorrection(true)
            .textInputAutocapitalization(.none)
            .padding(.all, 10)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.secondary, lineWidth: 1))
    }
}
