//
//  PlantaRegada.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 19/02/25.
//

import SwiftUI


struct PlantaRegadaView: View {
    @Environment(\.presentationMode) var presentationMode
    var planta: Planta
    @Binding var plantasNoJardim: [Planta]
    
    @State private var plantaRegada: Bool = false
    
    private var ultimaRega: Date? {
        let formatter = ISO8601DateFormatter()
        if let ultimaRegaString = UserDefaults.standard.string(forKey: "ultimaRega_\(planta.id.uuidString)") {
            return formatter.date(from: ultimaRegaString)
        }
        return nil
    }
    
    var horasNecessarias: Int {
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
    
    private func atualizarUltimaRega() {
        let formatter = ISO8601DateFormatter()
        let novaData = formatter.string(from: Date())
        UserDefaults.standard.set(novaData, forKey: "ultimaRega_\(planta.id.uuidString)")
        plantaRegada = true
    }
    
    var body: some View {
        ZStack {
            Image(planta.imagem)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                NavigationLink(destination: DetalhesPlantaView(planta: planta, plantasNoJardim: $plantasNoJardim)) {
                    VStack {
                        Text(planta.nome)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("(\(planta.nomeCienfitico))")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .italic()
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color("FontGreenDark").opacity(0.8))
                    .cornerRadius(12)
                    .padding(.top, 40)
                }
                
                Spacer()
                
                HStack {
                    VStack(spacing: 8) {
                        Image(systemName: plantaRegada ? "face.smiling" : "face.dashed")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                        Text(plantaRegada ? "Plantaregada.OKAY" : "plantaregada.BAD")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color("FontGreenDark").opacity(0.8))
                    .cornerRadius(12)
                    
                    Spacer()
                }
                .padding(.leading, 200)
                
                HStack {
                    VStack(spacing: 8) {
                        if plantaRegada {
                            Image(systemName: "drop.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            Text("\(horasNecessarias) plantaregada.hours")
                                .font(.headline)
                                .foregroundColor(.white)
                        } else {
                            Image(systemName: "drop")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            
                            Text("plantaregada.late")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(Color("FontGreenDark").opacity(0.8))
                    .cornerRadius(12)
                    
                    Spacer()
                }
                .padding(.leading, 200)
                
                Spacer()
                
                Button(action: {
                    atualizarUltimaRega()
                }) {
                    Text(plantaRegada ? "plantaregada.wateredPlant" : "plantaregada.wateringPlant")
                        .font(.headline)
                        .foregroundColor(plantaRegada ? .white : Color("FontGreenDark"))
                        .frame(width: 200, height: 50)
                        .background(plantaRegada ? Color("FontGreenDark") : Color.white)
                        .cornerRadius(12)
                }
                .padding(.bottom, 20)
            }
        }
        .onAppear {
            if let ultimaRega = ultimaRega {
                let horasDesdeUltimaRega = Calendar.current.dateComponents([.hour], from: ultimaRega, to: Date()).hour ?? 0
                plantaRegada = horasDesdeUltimaRega < horasNecessarias
            } else {
                plantaRegada = false
            }
        }
    }
}

struct PlantaRegadaView_Previews: PreviewProvider {
    static var previews: some View {
        PlantaRegadaView(
            planta: Planta(
                nome: "Zamioculta",
                nomeCienfitico: "Zamioculcas zamiifolia",
                descricao: "Descrição da planta",
                imagem: "Zamioculta",
                toxidade: "Leve",
                ervaDaninha: "Não",
                invasividade: "Não",
                tipoPlanta: "Ornamental",
                vidaUtil: "5-10 anos",
                tempoPlantio: "Primavera",
                genero: "Zamioculcas",
                familia: "Araceae",
                ordem: "Alismatales",
                classe: "Liliopsida",
                filo: "Angiosperma",
                resistencia: "ALTA",
                manutencao: "BAIXA"
            ),
            plantasNoJardim: .constant([])
        )
    }
}
