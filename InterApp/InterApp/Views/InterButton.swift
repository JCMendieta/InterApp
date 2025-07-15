//
//  InterButton.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 15/07/25.
//

import SwiftUI

//TODO: - Agregar esquema.
struct InterButton: View {
    let title: String
        let action: () -> Void

        var body: some View {
            Button(action: action) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.interBoneWhite)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.interMediumOrange)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.interBoneWhite, lineWidth: 2)
                    )
            }
        }
}

#Preview {
    InterButton(title: "Test") { }
}
