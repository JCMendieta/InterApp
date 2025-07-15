//
//  LocalidadCellView.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 15/07/25.
//

import SwiftUI

//TODO: - Agregar esquema.
struct LocalidadCellView: View {
    let locality: Localidad
    
    var body: some View {
        Button(action: {
                    print("Celda seleccionada: \(locality.nombreCompleto)")
                }) {
                    HStack(spacing: 15) {
                        Text(locality.nombreCompleto)
                            .fontWeight(.bold)
                        
                        Divider()
                            .background(Color.interBoneWhite)
                        
                        Text(locality.abreviacionCiudad)
                            .font(.subheadline)
                    }
                    .foregroundColor(Color.interBoneWhite)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.interDarkBlue)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.interBoneWhite, lineWidth: 2)
                    )
                }
    }
}

#Preview {
    LocalidadCellView(locality: Localidad(nombreCompleto: "NameTest", abreviacionCiudad: "ShortNameTest"))
}
