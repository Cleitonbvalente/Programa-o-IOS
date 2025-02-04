//
//  MeuJardimView.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 04/01/25.
//

import SwiftUI

struct MeuJardimView: View {
    @Binding var plantasNoJardim: [Planta]
    
    var body: some View {
        VStack {
            Text("Meu Jardim")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            if plantasNoJardim.isEmpty {
                Text("Seu jardim está vazio.")
                    .foregroundColor(.gray)
                    .italic()
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(plantasNoJardim) { planta in
                            CartaoDePlantaView(plantasFavoritas: .constant([]), planta: planta)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Meu jardim")
    }
}
                      

struct MeuJardimView_Previews: PreviewProvider {
    static var previews: some View {
        MeuJardimView(plantasNoJardim: .constant([]))
    }
}
