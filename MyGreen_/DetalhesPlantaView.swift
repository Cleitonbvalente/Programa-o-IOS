//
//  DetalhesPlantaView.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 07/01/25.
//

import SwiftUI

struct DetalhesPlantaView: View {
    let planta: Planta
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                Image(planta.imagem)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                
                VStack(alignment: .leading,spacing: 8) {
                    Text("Descrição")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color(hex: "#228B22"))
                    Text(planta.descricao)
                        .font(.body)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Sobre")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color(hex: "#228B22"))
                    
                    VStack(spacing: 8) {
                        LinhaDeInfo(titulo: "Toxidade", valor: planta.toxidade)
                        LinhaDeInfo(titulo: "Erva Daninha ou Não", valor: planta.ervaDaninha)
                        LinhaDeInfo(titulo: "Invasividade", valor: planta.invasividade)
                        LinhaDeInfo(titulo: "Tipo de planta", valor: planta.tipoPlanta)
                        LinhaDeInfo(titulo: "Vida Útil", valor: planta.vidaUtil)
                        LinhaDeInfo(titulo: "Tempo de Plantio", valor: planta.tempoPlantio)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top)
            
        }
        .navigationTitle(planta.nome)
    }
}

struct LinhaDeInfo: View {
    var titulo: String
    var valor: String
    
    var body: some View {
        HStack {
            Text(titulo)
                .font(.headline)
                .foregroundColor(.black)
            Spacer()
            Text(valor)
                .font(.body)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 5)
    }
}

struct Planta: Identifiable {
    let id = UUID()
    let nome: String
    let nomeCienfitico: String
    let descricao: String
    let imagem: String
    let toxidade: String
    let ervaDaninha: String
    let invasividade: String
    let tipoPlanta: String
    let vidaUtil: String
    let tempoPlantio: String
}


struct DetalhesPlantaView_Previews: PreviewProvider {
    static var previews: some View {
        DetalhesPlantaView(planta: Planta(nome: "Zamioculcas", nomeCienfitico: "Zamioculcas zamiifolia",
                                          descricao: "Zamiocultas é um gênero botânico, pertecente à família Araceae, que contém apenas a espécie Zamiocultas zamiifolia. A Zamioculcas zamiifolia, da família das Aráceas é uma planta originária da Tanzânia, na África.", imagem: "Zamioculta", toxidade: "Leve irritação na pele/olhos ao tocar e altamente tóxica quando ingerida", ervaDaninha: "Não", invasividade: "Não é invasiva", tipoPlanta: "Ornamental perene e suculenta", vidaUtil: "Cinco a dez anos ou mais", tempoPlantio: "Primavera ou início do verão"))
    }
}

