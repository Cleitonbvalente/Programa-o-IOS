//
//  FiltrosView.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 26/02/25.
//

import SwiftUI


struct FiltrosView: View {
    @Binding var mostrarFiltros: Bool
    @Binding var tipoSelecionado: String?
    @Binding var toxidadeSelecionada: String?
    @Binding var resistenciaSelecionada: String?
    @Binding var manutencaoSelecionada: String?
    @Binding var invasividadeSelecionada: String?
    @Binding var ervaDaninhaSelecionada: String?
    
    var body: some View {
        NavigationView {
            Form {
                FiltroPicker(titulo: "Tipo de Planta", opcoes: ["Ornamental", "Suculenta", "Trepadeira"], selecao: $tipoSelecionado)
                
                FiltroPicker(titulo: "Toxidade", opcoes: ["Tóxica", "Não Tóxica"], selecao: $toxidadeSelecionada)
                
                FiltroPicker(titulo: "Resistência", opcoes: ["Alta", "Média", "Baixa"], selecao: $resistenciaSelecionada)
                
                FiltroPicker(titulo: "Manutenção", opcoes: ["Alta", "Média", "Baixa"], selecao: $manutencaoSelecionada)
                
                FiltroPicker(titulo: "Invasividade", opcoes: ["Invasiva", "Não Invasiva"], selecao: $invasividadeSelecionada)
                
                FiltroPicker(titulo: "Erva Daninha", opcoes: ["Sim", "Não"], selecao: $ervaDaninhaSelecionada)
            }
            .navigationTitle("Filtros")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Aplicar") {
                        mostrarFiltros = false
                    }
                }
            }
        }
    }
    
    private func FiltroPicker(titulo: String, opcoes: [String], selecao: Binding<String?>) -> some View {
        Section(header: Text(titulo)) {
            Picker(titulo, selection: selecao) {
                Text("Todas").tag(nil as String?)
                ForEach(opcoes, id: \.self) { opcao in
                    Text(opcao).tag(opcao as String?)
                }
            }
            .pickerStyle(MenuPickerStyle())
        }
    }
}
