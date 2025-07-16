//
//  TablasScreen.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 15/07/25.
//

import SwiftUI

//TODO: - Agregar Strings a archivo dedicado
//TODO: - Agregar manejo de estados a la vista
struct TablasScreen: View {
    @StateObject private var viewModel = TablasScreenViewModel()
    
    var body: some View {
        List(viewModel.tableSchemas) { schema in
            VStack(alignment: .leading, spacing: 8) {
                Text(schema.nombreTabla)
                    .font(.headline)
                Text("PK: \(schema.pk)")
                    .font(.subheadline)
                Text("Campos: \(schema.numeroCampos)")
                    .font(.caption)
                Text("Última actualización: \(schema.fechaActualizacionSincro)")
                    .font(.caption2)
                    .foregroundColor(.gray)
                Text("Esquema: \(schema.queryCreacion)")
                    .font(.caption)
            }
            .padding(.vertical, 4)
        }
        .navigationTitle("Esquemas de Tablas")
        .onAppear {
            Task {
                await viewModel.fetchTableSchemas()
            }
        }
    }
}

#Preview {
    TablasScreen()
}
