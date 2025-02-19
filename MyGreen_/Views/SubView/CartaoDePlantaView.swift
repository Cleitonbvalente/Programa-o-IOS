//
//  CartaoDePlantaView
//  MyGreen_
//
//  Created by iredefbmac_30 on 27/12/24.
//import SwiftUI


import SwiftUI

struct CartaoDePlantaView: View {
    var nomePlanta: String { planta.nome }
    var nomeCientifico: String { planta.nomeCienfitico }
    var nomeImagem: String { planta.imagem }
    
    @Binding var plantasFavoritas: [Planta]
    @Binding var plantasNoJardim: [Planta]
    @State private var plantaRegada: Bool = false
    var planta: Planta
    
    var isFavorited: Bool {
        plantasFavoritas.contains { $0.id == planta.id }
    }
    
    var plantaEstaNoJardim: Bool {
        plantasNoJardim.contains { $0.id == planta.id }
    }
    
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
                
                Rectangle()
                    .fill(Color.green.opacity(0.6))
                    .frame(height: 50)
                    .cornerRadius(8)
                    .clipped()
                
                VStack {
                    Spacer()
                    HStack {
                        Text(nomePlanta)
                            .font(.headline)
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .truncationMode(.tail)
                        
                        if plantaEstaNoJardim {
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
                        Button(action: {
                            withAnimation {
                                if isFavorited {
                                    plantasFavoritas.removeAll { $0.id == planta.id }
                                } else {
                                    plantasFavoritas.append(planta)
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
            plantaRegada = planta.regada
        }
        .onChange(of: plantaRegada) { oldValue, newValue in
            if let index = plantasNoJardim.firstIndex(where: { $0.id == planta.id }) {
                plantasNoJardim[index].regada = newValue
            }
        }
    }
}
