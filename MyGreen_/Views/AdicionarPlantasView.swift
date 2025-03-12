//
//  AdicionarPlantasView.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 27/02/25.
//

import SwiftUI


struct AdicionarPlantasView: View {
    @Binding var plantasNoJardim: [Planta]
    @Environment(\.presentationMode) var presentationMode
    @State private var plantasSelecionadas: Set<UUID> = []
    
    var plantasDisponiveis: [Planta]

    var body: some View {
        NavigationView {
            List {
                ForEach(plantasDisponiveis) { planta in
                    HStack {
                        Text(planta.nome)
                            .font(.headline)
                        
                        Spacer()
                        
                        if plantasSelecionadas.contains(planta.id) {
                            Image(systemName: "checkmark")
                                .foregroundColor(Color("FontGreenDark"))
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if plantasSelecionadas.contains(planta.id) {
                            plantasSelecionadas.remove(planta.id)
                        } else {
                            plantasSelecionadas.insert(planta.id)
                        }
                    }
                }
            }
            .navigationTitle("Adicionar Plantas")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Adicionar") {
                        for id in plantasSelecionadas {
                            if let planta = plantasDisponiveis.first(where: { $0.id == id }) {
                                plantasNoJardim.append(planta)
                            }
                        }
                        salvarPlantasNoJardim(plantasNoJardim) // Salva as alterações
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}
