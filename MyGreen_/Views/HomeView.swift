//
//  ContentView.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 27/12/24.
//

import SwiftUI


struct HomeView: View {
    @State private var pesquisaTexto: String = ""
    @State private var plantasNoJardim: [Planta] = []
    @ObservedObject private var viewModel: HomeViewModel = .init()
    
    @State private var abaSelecionada: Int = 1
    
    @State private var mostrarFiltros = false
    @State private var tipoSelecionado: String? = nil
    @State private var toxidadeSelecionada: String? = nil
    @State private var resistenciaSelecionada: String? = nil
    @State private var manutencaoSelecionada: String? = nil
    @State private var invasividadeSelecionada: String? = nil
    @State private var ervaDaninhaSelecionada: String? = nil
    
    var plantasFiltradas: [Planta] {
        var plantas = viewModel.plantas
        
        if !pesquisaTexto.isEmpty {
            plantas = plantas.filter { planta in
                planta.nome.localizedCaseInsensitiveContains(pesquisaTexto) ||
                planta.nomeCienfitico.localizedCaseInsensitiveContains(pesquisaTexto)
            }
        }
        
        if let tipo = tipoSelecionado {
            plantas = plantas.filter { $0.tipoPlanta == tipo }
        }
        
        if let toxidade = toxidadeSelecionada {
            plantas = plantas.filter { $0.toxidade == toxidade }
        }
        
        if let resistencia = resistenciaSelecionada {
            plantas = plantas.filter { $0.resistencia == resistencia }
        }
        
        if let manutencao = manutencaoSelecionada {
            plantas = plantas.filter { $0.manutencao == manutencao }
        }
        
        if let invasividade = invasividadeSelecionada {
            plantas = plantas.filter { $0.invasividade == invasividade }
        }
        
        if let ervaDaninha = ervaDaninhaSelecionada {
            plantas = plantas.filter { $0.ervaDaninha == ervaDaninha }
        }
        
        return plantas
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                TabView(selection: $abaSelecionada) {
                    MeuJardimView(plantasNoJardim: $plantasNoJardim, plantasDisponiveis: viewModel.plantas)
                        .tabItem {
                            Image(systemName: "leaf")
                            Text("Meu Jardim")
                        }
                        .tag(0)
                    
                    VStack(spacing: 20) {
                        HStack {
                            Image("MyGreen Logomarca")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                        }
                        
                        // Barra de pesquisa
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Pesquisar plantas...", text: $pesquisaTexto)
                        }
                        .padding()
                        .background(Color(hex: "#F5F5DC"))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        
                        HStack {
                            Spacer()
                            Button(action: {
                                mostrarFiltros.toggle()
                            }) {
                                HStack {
                                    Text("Filtros")
                                        .foregroundColor(Color("FontGreenDark"))
                                        .font(.custom("San Francisco", size: 20))
                                    Image(systemName: "line.horizontal.3.decrease.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24)
                                        .foregroundColor(Color("FontGreenDark"))
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 0) {
                                ForEach(plantasFiltradas) { planta in
                                    CartaoDePlantaView(
                                        plantasFavoritas: $viewModel.plantasFavoritas,
                                        plantasNoJardim: $plantasNoJardim,
                                        planta: planta,
                                        isMeuJardim: false
                                    )
                                }
                            }
                            .padding(8)
                        }
                    }
                    .tabItem {
                        Image(systemName: "house")
                        Text("Início")
                    }
                    .tag(1)
                    
                    FavoritosView(plantasFavoritas: $viewModel.plantasFavoritas)
                        .tabItem {
                            Image(systemName: "heart")
                            Text("Favoritos")
                        }
                        .tag(2)
                }
                .accentColor(Color("FontGreenDark"))
            }
            .navigationTitle("")
            .sheet(isPresented: $mostrarFiltros) {
                FiltrosView(
                    mostrarFiltros: $mostrarFiltros,
                    tipoSelecionado: $tipoSelecionado,
                    toxidadeSelecionada: $toxidadeSelecionada,
                    resistenciaSelecionada: $resistenciaSelecionada,
                    manutencaoSelecionada: $manutencaoSelecionada,
                    invasividadeSelecionada: $invasividadeSelecionada,
                    ervaDaninhaSelecionada: $ervaDaninhaSelecionada
                )
            }
        }
    }
}

struct ConteudoView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
     
