//
//  PlantaRegada.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 19/02/25.
//

import SwiftUI


import SwiftUI

struct PlantaRegadaView: View {
    @Environment(\.presentationMode) var presentationMode
    var planta: Planta
    
    var body: some View {
        ZStack {
            Image(planta.imagem)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
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
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Image(systemName: "face.smiling")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                        Text("OK")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color("FontGreenDark").opacity(0.8))
                    .cornerRadius(12)
                    
                    HStack {
                        Image(systemName: "drop.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                        Text("Próxima rega: 14 horas")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color("FontGreenDark").opacity(0.8))
                    .cornerRadius(12)
                }
                .padding(.leading, 200)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Planta Regada")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color("FontGreenDark"))
                        .cornerRadius(12)
                        .padding()
                }
                .padding(.horizontal)
            }
        }
        #if os(iOS)
        .navigationTitle(planta.nome)
        #endif
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
                resistencia: "Alta", // Novo campo
                manutencao: "Baixa" // Novo campo
            )
        )
    }
}

