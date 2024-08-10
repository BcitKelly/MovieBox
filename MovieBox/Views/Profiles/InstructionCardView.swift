//
//  InstructionCardView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-08-05.
//

import SwiftUI

struct InstructionCardView: View{
    var instruction: Instruction

    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.5), .black.opacity(0.1)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
   
        ZStack() {
            gradient
            VStack(alignment: .leading) {
                Text(instruction.detail)
            }
            .padding()
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    InstructionCardView(instruction: Instruction.instructionData[0])
        .aspectRatio(3 / 2, contentMode: .fit)
}
