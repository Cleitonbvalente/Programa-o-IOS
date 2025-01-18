//
//  FavoritosView.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 11/01/25.
//

import SwiftUI

struct FavoritosView: View {
    @Binding var plantasFavoritas: [Planta]
    @State private var plantasNoJardim: [Planta] = []
    
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
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(plantasFavoritas) { planta in
                            NavigationLink(destination: DetalhesPlantaView(planta: planta, plantasNoJardim: $plantasNoJardim)) {
                                CartaoDePlantaView(nomePlanta: planta.nome,
                                                   nomeCientifico: planta.nomeCienfitico,
                                                   nomeImagem: planta.imagem,
                                                   plantasFavoritas: $plantasFavoritas,
                                                   planta: planta)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Favoritos")
        
    }
}

struct FavoritosView_Previews: PreviewProvider {
    @State static var plantasFavoritas: [Planta] = []
    
    static var previews: some View {
        FavoritosView(plantasFavoritas: $plantasFavoritas)
    }
}
