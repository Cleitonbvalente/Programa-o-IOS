//
//  CartaoDePlantaView
//  MyGreen_
//
//  Created by iredefbmac_30 on 27/12/24.
//import SwiftUI


import SwiftUI

import SwiftUI

struct CartaoDePlantaView: View {
    @Binding var plantasFavoritas: [Planta]
    @Binding var plantasNoJardim: [Planta]
    @State private var plantaRegada: Bool = false
    var planta: Planta
    var isMeuJardim: Bool // Novo parâmetro

    var body: some View {
        NavigationLink(
            destination: isMeuJardim ? AnyView(PlantaRegadaView(planta: planta)) : AnyView(DetalhesPlantaView(planta: planta, plantasNoJardim: $plantasNoJardim))
        ) {
            VStack(spacing: 0) {
                ZStack(alignment: .bottom) {
                    // Imagem da planta
                    Image(planta.imagem)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 180)
                        .cornerRadius(8)
                        .clipped()
                    
                    // Overlay de informações
                    Rectangle()
                        .fill(Color.green.opacity(0.6))
                        .frame(height: 50)
                        .cornerRadius(8)
                        .clipped()
                    
                    VStack {
                        Spacer()
                        HStack {
                            Text(planta.nome)
                                .font(.headline)
                                .foregroundColor(.white)
                                .lineLimit(1)
                                .truncationMode(.tail)
                            
                            if plantasNoJardim.contains(where: { $0.id == planta.id }) {
                                Button(action: {
                                    withAnimation {
                                        plantaRegada.toggle()
                                    }
                                }) {
                                    Image(systemName: "drop.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16, height: 16)
                                        .foregroundColor(plantaRegada ? .blue : .clear)
                                        .background(
                                            Circle()
                                                .stroke(Color.blue, lineWidth: 1)
                                                .background(Circle().fill(plantaRegada ? Color.blue : Color.clear))
                                        )
                                        .padding(.leading, 4)
                                }
                            }
                        }
                        .padding(.bottom, 2)

                        Text(planta.nomeCienfitico)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    // Botão de favorito
                    HStack {
                        Spacer()
                        VStack {
                            Button(action: {
                                withAnimation {
                                    if plantasFavoritas.contains(where: { $0.id == planta.id }) {
                                        plantasFavoritas.removeAll { $0.id == planta.id }
                                    } else {
                                        plantasFavoritas.append(planta)
                                    }
                                }
                            }) {
                                Image(systemName: plantasFavoritas.contains(where: { $0.id == planta.id }) ? "heart.fill" : "heart")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(plantasFavoritas.contains(where: { $0.id == planta.id }) ? Color("FontGreenDark") : Color("FontGreenDark"))
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
        }
    }
}
