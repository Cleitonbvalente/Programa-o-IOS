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
                Section(header: Text("Tipo de Planta")) {
                    Picker("Tipo", selection: $tipoSelecionado) {
                        Text("Todas").tag(nil as String?)
                        Text("Ornamental").tag("Ornamental" as String?)
                        Text("Suculenta").tag("Suculenta" as String?)
                        Text("Trepadeira").tag("Trepadeira" as String?)
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: Text("Toxidade")) {
                    Picker("Toxidade", selection: $toxidadeSelecionada) {
                        Text("Todas").tag(nil as String?)
                        Text("Tóxica").tag("Tóxica" as String?)
                        Text("Não Tóxica").tag("Não Tóxica" as String?)
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: Text("Resistência")) {
                    Picker("Resistência", selection: $resistenciaSelecionada) {
                        Text("Todas").tag(nil as String?)
                        Text("Alta").tag("Alta" as String?)
                        Text("Média").tag("Média" as String?)
                        Text("Baixa").tag("Baixa" as String?)
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: Text("Manutenção")) {
                    Picker("Manutenção", selection: $manutencaoSelecionada) {
                        Text("Todas").tag(nil as String?)
                        Text("Alta").tag("Alta" as String?)
                        Text("Média").tag("Média" as String?)
                        Text("Baixa").tag("Baixa" as String?)
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: Text("Invasividade")) {
                    Picker("Invasividade", selection: $invasividadeSelecionada) {
                        Text("Todas").tag(nil as String?)
                        Text("Invasiva").tag("Invasiva" as String?)
                        Text("Não Invasiva").tag("Não Invasiva" as String?)
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: Text("Erva Daninha")) {
                    Picker("Erva Daninha", selection: $ervaDaninhaSelecionada) {
                        Text("Todas").tag(nil as String?)
                        Text("Sim").tag("Sim" as String?)
                        Text("Não").tag("Não" as String?)
                    }
                    .pickerStyle(MenuPickerStyle())
                }
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
}
