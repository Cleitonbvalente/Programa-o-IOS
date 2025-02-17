//
//  DetalhesPlantaView.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 07/01/25.
//

import SwiftUI

import SwiftUI

struct DetalhesPlantaView: View {
    let planta: Planta
    @Binding var plantasNoJardim: [Planta]
    
    // Verifica se a planta já está no jardim
    private var plantaEstaNoJardim: Bool {
        plantasNoJardim.contains { $0.id == planta.id }
    }
    
    var body: some View {
        VStack(spacing: 0) { // Contêiner principal
            // Conteúdo rolável
            ScrollView {
                VStack(spacing: 20) {
                    // Imagem (ocupa toda a largura)
                    Image(planta.imagem)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity) // Ocupa toda a largura
                        .cornerRadius(12)
                        .shadow(radius: 5)
                        .padding(.horizontal, 0) // Remove o padding horizontal
                    
                    // Descrição
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Descrição")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color("FontGreenDark"))
                        
                        Text(planta.descricao)
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal) // Adiciona padding apenas nas laterais
                    
                    // Detalhes
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Detalhes")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color("FontGreenDark"))
                        
                        let detalhes: [(titulo: String, valor: String)] = [
                            ("Toxidade", planta.toxidade),
                            ("Erva Daninha", planta.ervaDaninha),
                            ("Invasividade", planta.invasividade),
                            ("Tipo", planta.tipoPlanta),
                            ("Vida Útil", planta.vidaUtil),
                            ("Tempo de Plantio", planta.tempoPlantio)
                        ]
                        
                        ForEach(detalhes.indices, id: \.self) { index in
                            let corFundo = index.isMultiple(of: 2) ? Color.gray.opacity(0.2) : Color.white
                            LinhaDeInfo(titulo: detalhes[index].titulo, valor: detalhes[index].valor, corFundo: corFundo)
                        }
                    }
                    .padding(.horizontal) // Adiciona padding apenas nas laterais
                }
                .padding(.vertical) // Adiciona padding vertical
                .padding(.bottom, 100) // Adiciona espaço para o botão
            }
            
            // Botão fixo na parte inferior
            Button(action: {
                if plantaEstaNoJardim {
                    // Remove a planta do jardim
                    plantasNoJardim.removeAll { $0.id == planta.id }
                } else {
                    // Adiciona a planta ao jardim
                    plantasNoJardim.append(planta)
                }
            }) {
                Text(plantaEstaNoJardim ? "Remover do Meu Jardim" : "Adicionar ao Meu Jardim")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(plantaEstaNoJardim ? Color.red : Color("FontGreenDark"))
                    .cornerRadius(12)
                    .padding()
            }
            .padding(.horizontal) // Adiciona padding apenas nas laterais
            .background(Color("CorDeFundo")) // Usando uma cor personalizada do Asset Catalog
        }
        .navigationTitle(planta.nome)
    }
}
struct LinhaDeInfo: View {
    var titulo: String
    var valor: String
    var corFundo: Color
    
    var body: some View {
        HStack {
            Text(titulo)
                .font(.headline)
                .foregroundColor(.black)
            Spacer()
            Text(valor)
                .font(.body)
                .foregroundColor(.black)
        }
        .padding(.vertical, 5)
        .background(corFundo)
        .cornerRadius(8)
    }
}

struct Planta: Identifiable {
    let id = UUID()
    let nome: String
    let nomeCienfitico: String
    let descricao: String
    let imagem: String
    var regada: Bool = false
    let toxidade: String
    let ervaDaninha: String
    let invasividade: String
    let tipoPlanta: String
    let vidaUtil: String
    let tempoPlantio: String
}


struct DetalhesPlantaView_Previews: PreviewProvider {
    @State static var plantasNoJardim: [Planta] = []
    
    static var previews: some View {
        DetalhesPlantaView(planta: Planta(nome: "Zamioculcas", nomeCienfitico: "Zamioculcas zamiifolia",
                                          descricao: "Zamiocultas é um gênero botânico, pertecente à família Araceae, que contém apenas a espécie Zamiocultas zamiifolia. A Zamioculcas zamiifolia, da família das Aráceas é uma planta originária da Tanzânia, na África.", imagem: "Zamioculta", toxidade: "Leve irritação na pele/olhos ao tocar e altamente tóxica quando ingerida", ervaDaninha: "Não", invasividade: "Não é invasiva", tipoPlanta: "Ornamental perene e suculenta", vidaUtil: "Cinco a dez anos ou mais", tempoPlantio: "Primavera ou início do verão"), plantasNoJardim: .constant([]))
    }
}
