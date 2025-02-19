//
//  BotaoDeNavegacaoView.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 29/01/25.
//


import SwiftUI

struct BotaoDeNavegacaoView: View {
    var nomeIcone: String
    var rotulo: String
    
    var body: some View {
        VStack {
            Image(systemName: nomeIcone)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(Color(hex: "#008000"))
            Text(rotulo)
                .font(.footnote)
        }
    }
}
