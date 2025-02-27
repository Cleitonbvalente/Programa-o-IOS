//
//  CartaoDePlantaView
//  MyGreen_
//
//  Created by iredefbmac_30 on 27/12/24.
//import SwiftUI


import SwiftUI


struct CartaoDePlantaView: View {
    @Binding var plantasFavoritas: [Planta]
    @Binding var plantasNoJardim: [Planta]
    @State private var plantaRegada: Bool = false
    var planta: Planta
    var isMeuJardim: Bool
    
    func truncarTexto(_ texto: String, limite: Int) -> String {
        if texto.count > limite {
            let indice = texto.index(texto.startIndex, offsetBy: limite)
            return String(texto[..<indice]) + "..."
        }
        return texto
    }

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
                        .frame(height: 220)
                        .cornerRadius(8)
                        .clipped()
                    
                    Rectangle()
                        .fill(isMeuJardim ? Color(hex: "#00FF00").opacity(0.8) : Color("FontGreenDark").opacity(0.8))
                        .frame(height: 60)
                        .cornerRadius(8)
                        .clipped()
                    
                    HStack(alignment: .center) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(truncarTexto(planta.nome, limite: 12))
                                .font(.system(size: 20))
                                .foregroundColor(isMeuJardim ? .black : .white)
                            
                            Text(truncarTexto(planta.nomeCienfitico, limite: 12))
                                .font(.system(size: 14)) // Fonte menor
                                .foregroundColor(isMeuJardim ? .black : .white)
                        }
                        
                        if isMeuJardim {
                            Image(systemName: "drop.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 28, height: 28)
                                .foregroundColor(Color("FontGreenDark"))
                                .padding(.leading, 8)
                        }
                    }
                    .padding(.horizontal, 32)
                    .padding(.bottom, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack {
                        HStack {
                            Spacer()
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
                                    .frame(width:24, height: 24)
                                    .foregroundColor(plantasFavoritas.contains(where: { $0.id == planta.id }) ? Color("FontGreenDark") : Color("FontGreenDark"))
                                    .padding(8)
                            }
                        }
                        .padding(.trailing, 20)
                        Spacer()
                    }
                }
                .frame(height: 220)
            }
            .frame(maxWidth: 180)
            .cornerRadius(8)
            .padding(.horizontal, 8)
            .padding(.bottom, 16)
        }
    }
}
