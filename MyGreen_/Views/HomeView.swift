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
    
    var body: some View {
        NavigationView {
            TabView {
                MeuJardimView(plantasNoJardim: $plantasNoJardim)
                    .tabItem {
                        Image(systemName: "leaf")
                        Text("Meu Jardim")
                    }
                
                VStack(spacing: 20) {
                    HStack {
                        Image("MyGreen Logomarca")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                    }
                    
                    VStack {
                        TextField("Pesquisar plantas...", text: $pesquisaTexto)
                            .padding()
                            .background(Color(hex: "#F5F5DC"))
                            .cornerRadius(8)
                            .padding(.horizontal)
                            .foregroundColor(Color.gray)
                        
                        HStack {
                            Spacer()
                            Button(action: {

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
                
                FavoritosView(plantasFavoritas: $viewModel.plantasFavoritas)
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Favoritos")
                    }
            }
            .accentColor(Color("FontGreenDark"))
        }
    }
}

struct ConteudoView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
