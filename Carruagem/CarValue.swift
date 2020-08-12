//
//  CarValue.swift
//  Carruagem
//
//  Created by Rafael Nunes on 12/08/20.
//  Copyright © 2020 Rafael Nunes. All rights reserved.
//

import UIKit

struct CarValue: Codable {
    let Valor: String
    let Marca: String
    let Modelo: String
    let AnoModelo: Int
    let Combustivel: String
    let CodigoFipe: String
    let MesReferencia: String
    let TipoVeiculo: Int
    let SiglaCombustivel: String
}
