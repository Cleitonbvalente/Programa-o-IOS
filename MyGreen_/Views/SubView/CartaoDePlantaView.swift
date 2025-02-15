//
//  CartaoDePlantaView.swift
//  MyGreen_
//
//  Created by iredefbmac on 29/01/25.
//


import SwiftUI

struct CartaoDePlantaView: View {
    var nomePlanta: String {planta.nome}
    var nomeCientifico: String {planta.nomeCienfitico}
    var nomeImagem: String {planta.imagem}
    @Binding var plantasFavoritas : [Planta]
    
    @State private var isFavorited = false
    
    var planta: Planta
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                
                Image(nomeImagem)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 180)        
                    .cornerRadius(8)
                    .clipped()
                
                Rectangle()
                    .fill(Color.green.opacity(0.6))
                    .frame(height: 50)
                    .cornerRadius(8)
                    .clipped()
                
                VStack {
                    Spacer()
                    Text(nomePlanta)
                        .font(.headline)
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .padding(.bottom, 2)
                    
                    Text(nomeCientifico)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                HStack {
                    Spacer()
                    VStack {
                        Button {
                            isFavorited.toggle()
                            
                            if isFavorited {
                                plantasFavoritas.append(planta)
                            } else {
                                if let index = plantasFavoritas.firstIndex(where: { $0.nome == planta.nome }) {
                                    plantasFavoritas.remove(at: index)
                                }
                            }
                        } label: {
                            //Label
                            Image(systemName: isFavorited ? "heart.fill" : "heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(isFavorited ? Color(hex: "008000") : Color(hex: "008000"))
                        }
                        .padding(6)
                        Spacer()
                    }
                }
            }
            
        }
        .cornerRadius(8)
        .padding(.horizontal, 8)
        .padding(.bottom, 16)
    }
}
