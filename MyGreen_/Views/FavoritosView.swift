//
//  FavoritosView.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 11/01/25.
//

import SwiftUI

import SwiftUI

struct FavoritosView: View {
    @Binding var plantasFavoritas: [Planta]
    @State private var plantasNoJardim: [Planta] = carregarPlantasNoJardim()

    var body: some View {
        VStack {
            Text("Plantas Favoritas")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            if plantasFavoritas.isEmpty {
                Text("Você ainda não tem plantas favoritas.")
                    .foregroundColor(.gray)
                    .italic()
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible())], spacing: 20) {
                        ForEach(plantasFavoritas) { planta in
                            NavigationLink(destination: DetalhesPlantaView(planta: planta, plantasNoJardim: $plantasNoJardim)) {
                                CartaoDePlantaView(
                                    plantasFavoritas: $plantasFavoritas,
                                    plantasNoJardim: $plantasNoJardim,
                                    planta: planta,
                                    isMeuJardim: false,
                                    isFavoritos: true,
                                    dataFavoritada: obterDataFavoritada(planta: planta)
                                )
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Favoritos")
        .foregroundColor(Color("FontGreenDark"))
        .onAppear {
            plantasFavoritas = carregarPlantasFavoritas()
        }
        .onChange(of: plantasFavoritas) { valorAntigo, novoValor in
            salvarPlantasFavoritas(novoValor)
        }
    }

    private func obterDataFavoritada(planta: Planta) -> Date? {
        if let dataFavoritadaString = UserDefaults.standard.string(forKey: "dataFavoritada_\(planta.id.uuidString)") {
            let formatter = ISO8601DateFormatter()
            return formatter.date(from: dataFavoritadaString)
        }
        return nil
    }
}

struct FavoritosView_Previews: PreviewProvider {
    @State static var plantasFavoritas: [Planta] = []
    
    static var previews: some View {
        FavoritosView(plantasFavoritas: $plantasFavoritas)
    }
}

