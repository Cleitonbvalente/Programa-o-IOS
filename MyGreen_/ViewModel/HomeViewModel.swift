//
//  HomeViewModel.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 29/01/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var plantasFavoritas: [Planta] = []
    
    var plantas: [Planta] = [
        Planta(nome: "Zamiocultas", nomeCienfitico: "Zamioculcas zamiifolia", descricao: "Zamiocultas é um gênero botânico, pertencente à família Araceae, que contém apenas a espécie Zamiocultas zamiifolia, da família das Aráceas é uma planta originária da Tanzânia, na África.", imagem: "Zamioculta", toxidade: "Leve irritação na pele/olhos ao tocar e altamente tóxica quando ingerida", ervaDaninha: "Não", invasividade: "Não é invasiva", tipoPlanta: "Ornamental perene e suculenta", vidaUtil: "Cinco a dez anos ou mais", tempoPlantio: "Primavera ou início do verão"),
        
        Planta(nome: "Jibóia-verde", nomeCienfitico: "Epipremnum aureum", descricao: "A Jibóia-verde (Epipremnum aureum) é uma planta trepadeira pertencente à família Araceae. É conhecida por suas folhas em formato de coração e tonalidade verde, que podem ter manchas ou marquinhas amarelas. Originária das florestas tropicais da região do Pacífico, ela é muito apreciada por seu uso ornamental e pela facilidade de cuidado.", imagem: "Jibóia-verde", toxidade: "Leve irritação na pele e nos olhos quando tocada. Pode ser tóxica se ingerida, principalmente para animais de estimação.", ervaDaninha: "Não", invasividade: "Não é considerada invasiva em ambientes controlados, mas pode se espalhar rapidamente em áreas abertas.", tipoPlanta: "Trepadeira ornamental perene.", vidaUtil: "Pode viver por muitos anos, com a manutenção adequada.", tempoPlantio: "Durante a primavera ou início do verão, preferindo climas quentes e úmidos."),
        
        Planta(nome: "Lírio-da-paz", nomeCienfitico: "Spathiphyllum spp", descricao: "O Lírio-da-paz (Spathiphyllum spp.) é uma planta perene da família Araceae, conhecida por suas folhas verdes brilhantes e flores brancas. Originária das regiões tropicais da América, é muito valorizada como planta ornamental devido à sua beleza e pela capacidade de purificar o ar.", imagem: "Lírio-da-paz", toxidade: "Tóxica se ingerida, causando irritação na boca, garganta e estômago", ervaDaninha: "Não", invasividade: "Não é invasiva", tipoPlanta: "Ornamental perene", vidaUtil: "Cinco a dez anos ou mais", tempoPlantio: "Durante a primavera ou o verão"),
        
        Planta(nome: "Samambaia Ha", nomeCienfitico: "Nephrolepis exaltata", descricao: "A Samambaia Ha (Nephrolepis exaltata) é uma planta da família Lomariopsidaceae, amplamente cultivada como ornamental. Sua folhagem densa e verde vibrante é muito apreciada em ambientes internos e externos. É originária das regiões tropicais e subtropicais do mundo.", imagem: "Samambaia", toxidade: "Não tóxica", ervaDaninha: "Não", invasividade: "Não é invasiva", tipoPlanta: "Planta ornamental perene", vidaUtil: "Vários anos com a manutenção adequada", tempoPlantio: "Durante a primavera ou início do verão")
    ]
}
