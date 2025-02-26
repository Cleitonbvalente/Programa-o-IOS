//
//  HomeViewModel.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 29/01/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    // Lista de plantas disponíveis
    @Published var plantas: [Planta] = []
    
    // Lista de plantas favoritas
    @Published var plantasFavoritas: [Planta] = []
    
    init() {
        // Carrega as plantas ao inicializar o ViewModel
        carregarPlantas()
    }
    
    // Método para carregar as plantas
    private func carregarPlantas() {
        self.plantas = [
            Planta(
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
            Planta(
                nome: "Jibóia-verde",
                nomeCienfitico: "Epipremnum aureum",
                descricao: "A Jibóia-verde (Epipremnum aureum) é uma planta trepadeira pertencente à família Araceae. É conhecida por suas folhas em formato de coração e tonalidade verde, que podem ter manchas ou marquinhas amarelas. Originária das florestas tropicais da região do Pacífico, ela é muito apreciada por seu uso ornamental e pela facilidade de cuidado.",
                imagem: "Jibóia-verde",
                toxidade: "Leve irritação na pele e nos olhos quando tocada. Pode ser tóxica se ingerida, principalmente para animais de estimação.",
                ervaDaninha: "Não",
                invasividade: "Não é considerada invasiva em ambientes controlados, mas pode se espalhar rapidamente em áreas abertas.",
                tipoPlanta: "Trepadeira ornamental perene.",
                vidaUtil: "Pode viver por muitos anos, com a manutenção adequada.",
                tempoPlantio: "Durante a primavera ou início do verão, preferindo climas quentes e úmidos.",
                genero: "Epipremnum",
                familia: "Araceae",
                ordem: "Alismatales",
                classe: "Liliopsida",
                filo: "Angiosperma",
                resistencia: "MÉDIA",
                manutencao: "MÉDIA"
            ),
            Planta(
                nome: "Lírio-da-paz",
                nomeCienfitico: "Spathiphyllum spp",
                descricao: "O Lírio-da-paz (Spathiphyllum spp.) é uma planta perene da família Araceae, conhecida por suas folhas verdes brilhantes e flores brancas. Originária das regiões tropicais da América, é muito valorizada como planta ornamental devido à sua beleza e pela capacidade de purificar o ar.",
                imagem: "Lírio-da-paz",
                toxidade: "Tóxica se ingerida, causando irritação na boca, garganta e estômago",
                ervaDaninha: "Não",
                invasividade: "Não é invasiva",
                tipoPlanta: "Ornamental perene",
                vidaUtil: "Cinco a dez anos ou mais",
                tempoPlantio: "Durante a primavera ou o verão",
                genero: "Spathiphyllum",
                familia: "Araceae",
                ordem: "Alismatales",
                classe: "Liliopsida",
                filo: "Angiosperma",
                resistencia: "BAIXA",
                manutencao: "ALTA"
            ),
            Planta(
                nome: "Samambaia Ha",
                nomeCienfitico: "Nephrolepis exaltata",
                descricao: "A Samambaia Ha (Nephrolepis exaltata) é uma planta da família Lomariopsidaceae, amplamente cultivada como ornamental. Sua folhagem densa e verde vibrante é muito apreciada em ambientes internos e externos. É originária das regiões tropicais e subtropicais do mundo.",
                imagem: "Samambaia",
                toxidade: "Não tóxica",
                ervaDaninha: "Não",
                invasividade: "Não é invasiva",
                tipoPlanta: "Planta ornamental perene",
                vidaUtil: "Vários anos com a manutenção adequada",
                tempoPlantio: "Durante a primavera ou início do verão",
                genero: "Nephrolepis",
                familia: "Lomariopsidaceae",
                ordem: "Polypodiales",
                classe: "Polypodiopsida",
                filo: "Tracheophyta",
                resistencia: "ALTA",
                manutencao: "BAIXA"
            ),
            Planta(
                nome: "Espada-de-São-Jorge",
                nomeCienfitico: "Sansevieria trifasciata",
                descricao: "A Espada-de-São-Jorge (Sansevieria trifasciata) é uma planta suculenta perene, pertencente à família Asparagaceae. É nativa da África Ocidental e é muito apreciada por suas folhas rígidas e verticais que podem purificar o ar.",
                imagem: "Espada-de-São-Jorge",
                toxidade: "Levemente tóxica se ingerida",
                ervaDaninha: "Não",
                invasividade: "Não é invasiva",
                tipoPlanta: "Suculenta perene",
                vidaUtil: "Vários anos com a manutenção adequada",
                tempoPlantio: "Durante a primavera ou verão",
                genero: "Sansevieria",
                familia: "Asparagaceae",
                ordem: "Asparagales",
                classe: "Liliopsida",
                filo: "Angiosperma",
                resistencia: "ALTA",
                manutencao: "BAIXA"
            ),
            Planta(
                nome: "Costela-de-Adão",
                nomeCienfitico: "Monstera deliciosa",
                descricao: "A Costela-de-Adão (Monstera deliciosa) é uma planta trepadeira tropical da família Araceae. Suas folhas grandes, perfuradas e brilhantes são características distintivas. É nativa das florestas tropicais da América Central.",
                imagem: "Costela-de-Adão",
                toxidade: "Levemente tóxica se ingerida",
                ervaDaninha: "Não",
                invasividade: "Não é invasiva",
                tipoPlanta: "Trepadeira tropical",
                vidaUtil: "Vários anos com a manutenção adequada",
                tempoPlantio: "Durante a primavera ou verão",
                genero: "Monstera",
                familia: "Araceae",
                ordem: "Alismatales",
                classe: "Liliopsida",
                filo: "Angiosperma",
                resistencia: "MÉDIA",
                manutencao: "MÉDIA"
            ),
            Planta(
                nome: "Suculenta Zebra",
                nomeCienfitico: "Haworthiopsis attenuata",
                descricao: "A Suculenta Zebra (Haworthiopsis attenuata) é uma planta suculenta pertencente à família Asphodelaceae. Originária da África do Sul, é conhecida por suas folhas verdes com listras brancas e pontas afiadas.",
                imagem: "Suculenta Zebra",
                toxidade: "Não tóxica",
                ervaDaninha: "Não",
                invasividade: "Não é invasiva",
                tipoPlanta: "Suculenta",
                vidaUtil: "Vários anos com a manutenção adequada",
                tempoPlantio: "Durante a primavera ou verão",
                genero: "Haworthiopsis",
                familia: "Asphodelaceae",
                ordem: "Asparagales",
                classe: "Liliopsida",
                filo: "Angiosperma",
                resistencia: "ALTA",
                manutencao: "BAIXA"
            ),
            Planta(
                nome: "Antúrio",
                nomeCienfitico: "Anthurium andraeanum",
                descricao: "O Antúrio (Anthurium andraeanum) é uma planta da família Araceae, conhecida por suas flores em forma de coração e folhas brilhantes. Originário da América Central e do Sul, é muito valorizado como planta ornamental.",
                imagem: "Antúrio",
                toxidade: "Tóxica se ingerida, causando irritação na boca e garganta",
                ervaDaninha: "Não",
                invasividade: "Não é invasiva",
                tipoPlanta: "Ornamental perene",
                vidaUtil: "Vários anos com a manutenção adequada",
                tempoPlantio: "Durante a primavera ou verão",
                genero: "Anthurium",
                familia: "Araceae",
                ordem: "Alismatales",
                classe: "Liliopsida",
                filo: "Angiosperma",
                resistencia: "MÉDIA",
                manutencao: "MÉDIA"
            ),
            Planta(
                nome: "Aloe Vera",
                nomeCienfitico: "Aloe barbadensis miller",
                descricao: "A Aloe Vera é uma planta suculenta pertencente à família Asphodelaceae. Originária do Norte da África, é conhecida por suas propriedades medicinais e uso em produtos de cuidados pessoais.",
                imagem: "Aloe Vera",
                toxidade: "Levemente tóxica se ingerida por animais de estimação",
                ervaDaninha: "Não",
                invasividade: "Não é invasiva",
                tipoPlanta: "Suculenta",
                vidaUtil: "Vários anos com a manutenção adequada",
                tempoPlantio: "Durante a primavera",
                genero: "Aloe",
                familia: "Asphodelaceae",
                ordem: "Asparagales",
                classe: "Liliopsida",
                filo: "Angiosperma",
                resistencia: "ALTA",
                manutencao: "BAIXA"
            ),
            Planta(
                nome: "Lavanda",
                nomeCienfitico: "Lavandula angustifolia",
                descricao: "A Lavanda (Lavandula angustifolia) é uma planta da família Lamiaceae, conhecida por suas flores roxas perfumadas e propriedades relaxantes. Originária do Mediterrâneo, é muito usada em jardins e em produtos de aromaterapia.",
                imagem: "Lavanda",
                toxidade: "Não tóxica",
                ervaDaninha: "Não",
                invasividade: "Não é invasiva",
                tipoPlanta: "Ornamental perene",
                vidaUtil: "Vários anos com a manutenção adequada",
                tempoPlantio: "Durante a primavera ou verão",
                genero: "Lavandula",
                familia: "Lamiaceae",
                ordem: "Lamiales",
                classe: "Magnoliopsida",
                filo: "Angiosperma",
                resistencia: "MÉDIA",
                manutencao: "MÉDIA"
            ),
            Planta(
                nome: "Bromélia",
                nomeCienfitico: "Bromelia spp.",
                descricao: "A Bromélia (Bromelia spp.) é uma planta tropical da família Bromeliaceae. Originária das Américas, é valorizada por suas flores coloridas e folhagem exótica. É uma ótima opção para jardins tropicais.",
                imagem: "Bromélia",
                toxidade: "Não tóxica",
                ervaDaninha: "Não",
                invasividade: "Não é invasiva",
                tipoPlanta: "Ornamental perene",
                vidaUtil: "Vários anos com a manutenção adequada",
                tempoPlantio: "Durante a primavera ou verão",
                genero: "Bromelia",
                familia: "Bromeliaceae",
                ordem: "Poales",
                classe: "Liliopsida",
                filo: "Angiosperma",
                resistencia: "MÉDIA",
                manutencao: "MÉDIA"
            ),
            Planta(
                nome: "Cactos",
                nomeCienfitico: "Cactaceae",
                descricao: "Os Cactos (Cactaceae) são plantas suculentas da família Cactaceae, nativas das Américas. São conhecidos por sua adaptação a ambientes áridos e suas formas variadas e muitas vezes espinhosas.",
                imagem: "Cactos",
                toxidade: "Não tóxica",
                ervaDaninha: "Não",
                invasividade: "Não é invasiva",
                tipoPlanta: "Suculenta perene",
                vidaUtil: "Vários anos com a manutenção adequada",
                tempoPlantio: "Durante a primavera ou verão",
                genero: "Cactaceae",
                familia: "Cactaceae",
                ordem: "Caryophyllales",
                classe: "Magnoliopsida",
                filo: "Angiosperma",
                resistencia: "ALTA",
                manutencao: "BAIXA"
            )
        ]
    }
    
    func toggleFavorito(planta: Planta) {
        if let index = plantasFavoritas.firstIndex(where: { $0.id == planta.id }) {
            plantasFavoritas.remove(at: index)
        } else {
            plantasFavoritas.append(planta)
        }
    }
    
    func isFavorito(planta: Planta) -> Bool {
        return plantasFavoritas.contains { $0.id == planta.id }
    }
}
