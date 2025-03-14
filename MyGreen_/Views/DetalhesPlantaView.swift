//
//  DetalhesPlantaView.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 07/01/25.
//

import SwiftUI


struct DetalhesPlantaView: View {
    @EnvironmentObject var appSettings: AppSettings
    let planta: Planta
    @Binding var plantasNoJardim: [Planta]
    
    private var plantaEstaNoJardim: Bool {
        plantasNoJardim.contains { $0.id == planta.id }
    }
    
    private func calcularNivelDificuldade(resistencia: String, manutencao: String) -> Int {
        if resistencia == "ALTA" && manutencao == "BAIXA" {
            return 1
        } else if resistencia == "MÉDIA" && manutencao == "MÉDIA" {
            return 2
        } else {
            return 3
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 20) {
                    Image(planta.imagem)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                        .padding(.horizontal, 0)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Detalhesplanta.about")
                            .font(.title2)
                            .bold()
                            .foregroundColor(appSettings.modoEscuroAtivo ? Color(hex: "32CD32"): Color("FontGreenDark"))
                        
                        Text(planta.descricao)
                            .font(.body)
                            .foregroundColor(appSettings.modoEscuroAtivo ? .white : .black)
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Detalhesplanta.details")
                            .font(.title2)
                            .bold()
                            .foregroundColor(appSettings.modoEscuroAtivo ? Color(hex: "32CD32") : Color("FontGreenDark"))
                        
                        let detalhes: [(titulo: String, valor: String)] = [
                            ("Toxidade", planta.toxidade),
                            ("Erva Daninha", planta.ervaDaninha),
                            ("Invasividade", planta.invasividade),
                            ("Tipo", planta.tipoPlanta),
                            ("Vida Útil", planta.vidaUtil),
                            ("Tempo de Plantio", planta.tempoPlantio)
                        ]
                        
                        ForEach(detalhes.indices, id: \.self) { index in
                            // Ajuste dinâmico das cores de fundo e texto
                            let corFundo = index.isMultiple(of: 2) ?
                                (appSettings.modoEscuroAtivo ? Color.gray.opacity(0.1) : Color.gray.opacity(0.1)) :
                                (appSettings.modoEscuroAtivo ? Color.black.opacity(0.05) : Color.white)
                            
                            let corTexto = appSettings.modoEscuroAtivo ? Color.white : Color.black
                            
                            LinhaDeInfo(titulo: detalhes[index].titulo, valor: detalhes[index].valor, corFundo: corFundo, corTexto: corTexto)
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Detalhesplanta.scientificClassification")
                            .font(.title2)
                            .bold()
                            .foregroundColor(appSettings.modoEscuroAtivo ? Color(hex: "32CD32") : Color("FontGreenDark"))
                        
                        let classificacaoCientifica: [(titulo: String, valor: String)] = [
                            ("Gênero", planta.genero),
                            ("Família", planta.familia),
                            ("Ordem", planta.ordem),
                            ("Classe", planta.classe),
                            ("Filo", planta.filo)
                        ]
                        
                        ForEach(classificacaoCientifica.indices, id: \.self) { index in
                            let corFundo = index.isMultiple(of: 2) ?
                                (appSettings.modoEscuroAtivo ? Color.gray.opacity(0.1) : Color.gray.opacity(0.1)) :
                                (appSettings.modoEscuroAtivo ? Color.black.opacity(0.05) : Color.white)
                            
                            let corTexto = appSettings.modoEscuroAtivo ? Color.white : Color.black
                            
                            LinhaDeInfo(titulo: classificacaoCientifica[index].titulo, valor: classificacaoCientifica[index].valor, corFundo: corFundo, corTexto: corTexto)
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("detalhesplanta.difficulty")
                            .font(.title2)
                            .bold()
                            .foregroundColor(appSettings.modoEscuroAtivo ? Color(hex: "32CD32") : Color("FontGreenDark"))
                        
                        DificuldadeIcone(nivel: calcularNivelDificuldade(resistencia: planta.resistencia, manutencao: planta.manutencao))
                            .padding(.vertical, 8)
                        
                        HStack(spacing: 40) {
                            VStack(alignment: .center, spacing: 4) {
                                Text("detalhesplanta.resistance")
                                    .font(.headline)
                                    .foregroundColor(appSettings.modoEscuroAtivo ? .white : .black)
                                Text(planta.resistencia)
                                    .font(.body)
                                    .foregroundColor(appSettings.modoEscuroAtivo ? .white : .black)
                            }
                            
                            Text("|")
                                .font(.headline)
                                .foregroundColor(appSettings.modoEscuroAtivo ? .white : .black)
                            
                            VStack(alignment: .center, spacing: 4) {
                                Text("detalhesplanta.maintenance")
                                    .font(.headline)
                                    .foregroundColor(appSettings.modoEscuroAtivo ? .white : .black)
                                Text(planta.manutencao)
                                    .font(.body)
                                    .foregroundColor(appSettings.modoEscuroAtivo ? .white : .black)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
                .padding(.bottom, 100)
            }
            
            Button(action: {
                if plantaEstaNoJardim {
                    plantasNoJardim.removeAll { $0.id == planta.id }
                } else {
                    plantasNoJardim.append(planta)
                }
                salvarPlantasNoJardim(plantasNoJardim)
            }) {
                Text(plantaEstaNoJardim ? "detalhesplanta.removeFromMyGarden" : "detalhesplanta.addToMyGarden")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(plantaEstaNoJardim ? Color.red : Color("FontGreenDark"))
                    .cornerRadius(12)
                    .padding()
            }
            .padding(.horizontal)
            .background(appSettings.modoEscuroAtivo ? Color.black : Color("CorDeFundo"))
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(planta.nome)
                    .font(.title3)
                    .bold()
                    .foregroundColor(appSettings.modoEscuroAtivo ? Color(hex: "32CD32"): Color("FontGreenDark"))
            }
        }
        .preferredColorScheme(appSettings.modoEscuroAtivo ? .dark : .light)
    }
}

struct DificuldadeIcone: View {
    let nivel: Int
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(1..<4) { index in
                Image(systemName: index <= nivel ? "leaf.fill" : "leaf")
                    .foregroundColor(index <= nivel ? Color("FontGreenDark") : Color.gray)
            }
        }
        .font(.system(size: 20))
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct LinhaDeInfo: View {
    var titulo: String
    var valor: String
    var corFundo: Color
    var corTexto: Color
    
    var body: some View {
        HStack {
            Text(titulo)
                .font(.headline)
                .foregroundColor(corTexto)
            Spacer()
            Text(valor)
                .font(.body)
                .foregroundColor(corTexto)
        }
        .padding(.vertical, 5)
        .background(corFundo)
        .cornerRadius(8)
    }
}

struct Planta: Identifiable, Codable, Equatable {
    var id: UUID = UUID()
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
    
    let genero: String
    let familia: String
    let ordem: String
    let classe: String
    let filo: String
    
    let resistencia: String
    let manutencao: String
    
    init(
        nome: String,
        nomeCienfitico: String,
        descricao: String,
        imagem: String,
        regada: Bool = false,
        toxidade: String,
        ervaDaninha: String,
        invasividade: String,
        tipoPlanta: String,
        vidaUtil: String,
        tempoPlantio: String,
        genero: String,
        familia: String,
        ordem: String,
        classe: String,
        filo: String,
        resistencia: String,
        manutencao: String
    ) {
        self.nome = nome
        self.nomeCienfitico = nomeCienfitico
        self.descricao = descricao
        self.imagem = imagem
        self.regada = regada
        self.toxidade = toxidade
        self.ervaDaninha = ervaDaninha
        self.invasividade = invasividade
        self.tipoPlanta = tipoPlanta
        self.vidaUtil = vidaUtil
        self.tempoPlantio = tempoPlantio
        self.genero = genero
        self.familia = familia
        self.ordem = ordem
        self.classe = classe
        self.filo = filo
        self.resistencia = resistencia
        self.manutencao = manutencao
    }
}


struct DetalhesPlantaView_Previews: PreviewProvider {
    @State static var plantasNoJardim: [Planta] = []
    
    static var previews: some View {
        DetalhesPlantaView(
            planta: Planta(
                nome: "Zamiocultas",
                nomeCienfitico: "Zamioculcas zamiifolia",
                descricao: "Zamiocultas é um gênero botânico, pertencente à família Araceae, que contém apenas a espécie Zamiocultas zamiifolia, da família das Aráceas é uma planta originária da Tanzânia, na África.",
                imagem: "Zamioculta",
                toxidade: "Leve irritação na pele/olhos ao tocar e altamente tóxica quando ingerida",
                ervaDaninha: "Não",
                invasividade: "Não é invasiva",
                tipoPlanta: "Ornamental perene e suculenta",
                vidaUtil: "Cinco a dez anos ou mais",
                tempoPlantio: "Primavera ou início do verão",
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
        .environmentObject(AppSettings())
    }
}
