//
//  ContentView.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 27/12/24.
//

import SwiftUI

struct ContentView:
    View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
            Text("Hello, world!") }
        .padding() } }

import SwiftUI

struct ConteudoView: View {
    @State private var plantasFavoritas: [Planta] = []
    @State private var pesquisaTexto: String = ""
    @State private var plantasNoJardim: [Planta] = []
    
    var plantas: [Planta] = [
        Planta(nome: "Zamiocultas", nomeCienfitico: "Zamioculcas zamiifolia", descricao: "Zamiocultas é um gênero botânico, pertencente à família Araceae, que contém apenas a espécie Zamiocultas zamiifolia, da família das Aráceas é uma planta originária da Tanzânia, na África.", imagem: "Zamioculta", toxidade: "Leve irritação na pele/olhos ao tocar e altamente tóxica quando ingerida", ervaDaninha: "Não", invasividade: "Não é invasiva", tipoPlanta: "Ornamental perene e suculenta", vidaUtil: "Cinco a dez anos ou mais", tempoPlantio: "Primavera ou início do verão"),
        
        Planta(nome: "Jibóia-verde", nomeCienfitico: "Epipremnum aureum", descricao: "A Jibóia-verde (Epipremnum aureum) é uma planta trepadeira pertencente à família Araceae. É conhecida por suas folhas em formato de coração e tonalidade verde, que podem ter manchas ou marquinhas amarelas. Originária das florestas tropicais da região do Pacífico, ela é muito apreciada por seu uso ornamental e pela facilidade de cuidado.", imagem: "Jibóia-verde", toxidade: "Leve irritação na pele e nos olhos quando tocada. Pode ser tóxica se ingerida, principalmente para animais de estimação.", ervaDaninha: "Não", invasividade: "Não é considerada invasiva em ambientes controlados, mas pode se espalhar rapidamente em áreas abertas.", tipoPlanta: "Trepadeira ornamental perene.", vidaUtil: "Pode viver por muitos anos, com a manutenção adequada.", tempoPlantio: "Durante a primavera ou início do verão, preferindo climas quentes e úmidos."),
        
        Planta(nome: "Lírio-da-paz", nomeCienfitico: "Spathiphyllum spp", descricao: "O Lírio-da-paz (Spathiphyllum spp.) é uma planta perene da família Araceae, conhecida por suas folhas verdes brilhantes e flores brancas. Originária das regiões tropicais da América, é muito valorizada como planta ornamental devido à sua beleza e pela capacidade de purificar o ar.", imagem: "Lírio-da-paz", toxidade: "Tóxica se ingerida, causando irritação na boca, garganta e estômago", ervaDaninha: "Não", invasividade: "Não é invasiva", tipoPlanta: "Ornamental perene", vidaUtil: "Cinco a dez anos ou mais", tempoPlantio: "Durante a primavera ou o verão"),
    
        Planta(nome: "Samambaia Ha", nomeCienfitico: "Nephrolepis exaltata", descricao: "A Samambaia Ha (Nephrolepis exaltata) é uma planta da família Lomariopsidaceae, amplamente cultivada como ornamental. Sua folhagem densa e verde vibrante é muito apreciada em ambientes internos e externos. É originária das regiões tropicais e subtropicais do mundo.", imagem: "Samambaia", toxidade: "Não tóxica", ervaDaninha: "Não", invasividade: "Não é invasiva", tipoPlanta: "Planta ornamental perene", vidaUtil: "Vários anos com a manutenção adequada", tempoPlantio: "Durante a primavera ou início do verão")
        ]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Image("MyGreen Logomarca")
                        .resizable()
                        .frame(width: 100, height: 50)
                    Spacer()
                }
                .padding()
                
                HStack {
                    TextField("Pesquisar plantas...", text: $pesquisaTexto)
                        .padding()
                        .background(Color(.gray).opacity(0.2))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.trailing)
                            .foregroundColor(Color(hex: "#32CD32"))
                    }
                }
                .padding(.top)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(plantas) { planta in
                            NavigationLink(destination: DetalhesPlantaView(planta: planta, plantasNoJardim: $plantasNoJardim)) {
                                CartaoDePlantaView(nomePlanta: planta.nome,
                                                   nomeCientifico: planta.nomeCienfitico,
                                                   nomeImagem: planta.imagem,
                                                   plantasFavoritas: $plantasFavoritas,
                                                   planta: planta)
                            }
                        }
                    }
                    .padding()
                }
                
                HStack {
                    NavigationLink(destination: MeuJardimView(plantasNoJardim: $plantasNoJardim)) {
                        BotaoDeNavegacaoView(nomeIcone: "leaf", rotulo: "Meu jardim")
                    }
                    .foregroundColor(.black)
                    Spacer()
                    NavigationLink(destination: ContentView()) {
                        BotaoDeNavegacaoView(nomeIcone: "house", rotulo: "Início")
                            .foregroundColor(.black)
                    }
                    Spacer()
                    NavigationLink(destination: FavoritosView(plantasFavoritas: $plantasFavoritas)) {
                        BotaoDeNavegacaoView(nomeIcone: "heart", rotulo: "Favoritos")
                            .foregroundColor(.black)
                    }
                }
                .padding()
                .background(Color(.gray).opacity(0.2))
            }
        }
    }
}
                
 
struct CartaoDePlantaView: View {
    var nomePlanta: String
    var nomeCientifico: String
    var nomeImagem: String
    @Binding var plantasFavoritas : [Planta]
    
    @State private var isFavorited = false
    
    var planta: Planta
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image(nomeImagem)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                    .cornerRadius(8)
                    .shadow(radius: 5)
                
                Button(action: {
                    isFavorited.toggle()
                    
                    if isFavorited {
                        plantasFavoritas.append(planta)
                    } else {
                        if let index = plantasFavoritas.firstIndex(where: { $0.nome == planta.nome }) {
                            plantasFavoritas.remove(at: index)
                        }
                    }
                }) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(isFavorited ? Color(hex: "#32CD32") : Color(hex: "#90EE90"))
                        .padding(10)
                        .scaleEffect(1.3)
                }
                .offset(x: -4, y: 4)
            }
            
            VStack(alignment: .leading) {
                Text(nomePlanta)
                    .font(.headline)
                    .padding(.top, 5)
                    .foregroundColor(.black)
                
                Text(nomeCientifico)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding([.leading, .trailing])
        }
        .padding()
        .background(Color(.gray).opacity(0.1))
        .cornerRadius(8)
    }
}

struct BotaoDeNavegacaoView: View {
    var nomeIcone: String
    var rotulo: String
    
    var body: some View {
        VStack {
            Image(systemName: nomeIcone)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(Color(hex: "#32CD32"))
            Text(rotulo)
                .font(.footnote)
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.index(after: hex.startIndex)
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
struct ConteudoView_Previews: PreviewProvider {
    static var previews: some View {
        ConteudoView()
    }
}
