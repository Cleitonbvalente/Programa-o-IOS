//
//  CartaoDePlantaView.swift
//  MyGreen_
//
//  Created by iredefbmac on 29/01/25.
//


import SwiftUI

struct CartaoDePlantaView: View {
    var nomePlanta: String { planta.nome }
    var nomeCientifico: String { planta.nomeCienfitico }
    var nomeImagem: String { planta.imagem }
    @Binding var plantasFavoritas: [Planta]
    @Binding var plantasNoJardim: [Planta] // Nova binding para a lista de plantas no jardim
    @State private var isFavorited = false
    
    var planta: Planta
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                // Imagem da planta
                Image(nomeImagem)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 180)
                    .cornerRadius(8)
                    .clipped()
                
                // Overlay com nome e nome científico
                Rectangle()
                    .fill(Color.green.opacity(0.6))
                    .frame(height: 50)
                    .cornerRadius(8)
                    .clipped()
                
                VStack {
                    Spacer()
                    HStack {
                        // Nome da planta
                        Text(nomePlanta)
                            .font(.headline)
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .truncationMode(.tail)
                        
                        // Ícone de água (se a planta foi regada e está no Meu Jardim)
                        if plantasNoJardim.contains(where: { $0.id == planta.id }) && planta.regada {
                            Image(systemName: "drop.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                                .foregroundColor(.blue)
                                .padding(.leading, 4)
                        }
                    }
                    .padding(.bottom, 2)
                    
                    Text(nomeCientifico)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                // Ícone de coração (favoritos)
                HStack {
                    Spacer()
                    VStack {
                        Button(action: {
                            isFavorited.toggle()
                            
                            if isFavorited {
                                plantasFavoritas.append(planta)
                            } else {
                                if let index = plantasFavoritas.firstIndex(where: { $0.id == planta.id }) {
                                    plantasFavoritas.remove(at: index)
                                }
                            }
                        }) {
                            Image(systemName: isFavorited ? "heart.fill" : "heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(isFavorited ? Color("FontGreenDark") : Color("FontGreenDark"))
                                .padding(6)
                        }
                        Spacer()
                    }
                }
            }
        }
        .cornerRadius(8)
        .padding(.horizontal, 8)
        .padding(.bottom, 16)
        .onAppear {
            // Atualiza o estado do ícone do coração ao aparecer
            isFavorited = plantasFavoritas.contains { $0.id == planta.id }
        }
    }
}
