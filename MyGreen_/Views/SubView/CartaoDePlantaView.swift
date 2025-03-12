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
    var planta: Planta
    var isMeuJardim: Bool
    var isFavoritos: Bool = false
    var dataFavoritada: Date? = nil

    @State private var plantaRegada: Bool = false

    private var horasNecessarias: Int {
        let horasParaRegar: [String: Int] = [
            "Zamiocultas": 14,
            "Jibóia-verde": 7,
            "Lírio-da-paz": 10,
            "Samambaia Ha": 5,
            "Espada-de-São-Jorge": 30,
            "Costela-de-Adão": 7,
            "Suculenta Zebra": 14,
            "Antúrio": 7,
            "Aloe Vera": 14,
            "Lavanda": 10,
            "Bromélia": 7,
            "Cactos": 30,
        ]
        return horasParaRegar[planta.nome] ?? 24
    }

    private func regarPlanta() {
        let formatter = ISO8601DateFormatter()
        let novaData = formatter.string(from: Date())
        UserDefaults.standard.set(novaData, forKey: "ultimaRega_\(planta.id.uuidString)")
        plantaRegada = true
    }

    var body: some View {
        NavigationLink(
            destination: isMeuJardim ? AnyView(PlantaRegadaView(planta: planta, plantasNoJardim: $plantasNoJardim)) : AnyView(DetalhesPlantaView(planta: planta, plantasNoJardim: $plantasNoJardim))
        ) {
            if isFavoritos {
                HStack(alignment: .center, spacing: 16) {
                    Image(planta.imagem)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                        .cornerRadius(8)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(planta.nome)
                            .font(.title3)
                            .foregroundColor(.black)
                        
                        Text(planta.nomeCienfitico)
                            .font(.headline)
                            .foregroundColor(.gray)
                        
                        if let dataFavoritada = dataFavoritada {
                            Text(calcularTempoFavoritamento(dataFavoritada: dataFavoritada))
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color("FontGreenDark"))
                                .cornerRadius(4)
                        }
                    }
                    
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
                            .frame(width: 24, height: 24)
                            .foregroundColor(plantasFavoritas.contains(where: { $0.id == planta.id }) ? Color("FontGreenDark") : Color("FontGreenDark"))
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 2)
            } else {
                VStack(spacing: 0) {
                    ZStack(alignment: .bottom) {
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
                                    .lineLimit(1)
                                
                                Text(truncarTexto(planta.nomeCienfitico, limite: 12))
                                    .font(.system(size: 14))
                                    .foregroundColor(isMeuJardim ? .black : .white)
                                    .lineLimit(1)
                            }
                            
                            if isMeuJardim {
                                Button(action: {
                                    regarPlanta()
                                }) {
                                    Image(systemName: plantaRegada ? "drop.fill" : "drop")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 28, height: 28)
                                        .foregroundColor(Color("FontGreenDark"))
                                        .padding(.leading, 8)
                                }
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
                                        .frame(width: 24, height: 24)
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
        .onAppear {
            let formatter = ISO8601DateFormatter()
            if let ultimaRegaString = UserDefaults.standard.string(forKey: "ultimaRega_\(planta.id.uuidString)"),
               let ultimaRega = formatter.date(from: ultimaRegaString) {
                let horasDesdeUltimaRega = Calendar.current.dateComponents([.hour], from: ultimaRega, to: Date()).hour ?? 0
                plantaRegada = horasDesdeUltimaRega < horasNecessarias
            } else {
                plantaRegada = false
            }
        }
    }

    private func calcularTempoFavoritamento(dataFavoritada: Date) -> String {
        let intervalo = Calendar.current.dateComponents([.day], from: dataFavoritada, to: Date())
        
        if let dias = intervalo.day {
            if dias < 7 {
                return "Iniciante"
            } else if dias < 30 {
                return "Intermediário"
            } else {
                return "Experiente"
            }
        }
        
        return "Iniciante"
    }

    private func truncarTexto(_ texto: String, limite: Int) -> String {
        if texto.count > limite {
            let indice = texto.index(texto.startIndex, offsetBy: limite)
            return String(texto[..<indice]) + "..."
        }
        return texto
    }
}
