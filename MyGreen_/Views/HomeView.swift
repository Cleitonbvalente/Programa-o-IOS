//
//  ContentView.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 27/12/24.
//

import SwiftUI

import SwiftUI

struct HomeView: View {
    @State private var pesquisaTexto: String = ""
    @State private var plantasNoJardim: [Planta] = []
    @ObservedObject private var viewModel: HomeViewModel = .init()
    
    var body: some View {
        NavigationView {
            TabView {
                // Aba Meu Jardim
                MeuJardimView(plantasNoJardim: $plantasNoJardim)
                    .tabItem {
                        Image(systemName: "leaf")
                        Text("Meu Jardim")
                    }
                
                // Aba Início
                VStack(spacing: 20) {
                    // Logo do MyGreen
                    HStack {
                        Image("MyGreen Logomarca") // Substitua pelo nome da sua imagem
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                    }
                    
                    // Campo de pesquisa
                    VStack {
                        TextField("Pesquisar plantas...", text: $pesquisaTexto)
                            .padding()
                            .background(Color(.gray).opacity(0.2))
                            .cornerRadius(8)
                            .padding(.horizontal)
                        
                        // Botão de filtros (opcional)
                        HStack {
                            Spacer()
                            Button(action: {
                                // Ação do filtro
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
                    }
                    
                    // Lista de plantas
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 0) {
                            ForEach(viewModel.plantas) { planta in
                                NavigationLink(destination: DetalhesPlantaView(planta: planta, plantasNoJardim: $plantasNoJardim)) {
                                    CartaoDePlantaView(
                                        plantasFavoritas: $viewModel.plantasFavoritas,
                                        plantasNoJardim: $plantasNoJardim,
                                        planta: planta
                                    )
                                }
                            }
                        }
                        .padding(8)
                    }
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Início")
                }
                
                // Aba Favoritos
                FavoritosView(plantasFavoritas: $viewModel.plantasFavoritas)
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Favoritos")
                    }
            }
            .accentColor(Color("FontGreenDark")) // Cor de destaque para as abas
        }
    }
}

struct ConteudoView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
