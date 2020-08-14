//
//  GaragePresenter.swift
//  Carruagem
//
//  Created by Rafael Nunes on 14/08/20.
//  Copyright © 2020 Rafael Nunes. All rights reserved.
//

import Foundation

protocol GaragePresenterDelegate {
    func provideBrandContent(object: [CarBrand])
    func provideTemplateContent(object: [CarTemplate])
    func provideYearContent(object: [CarYear])
    func provideValueContent(object: [CarValue])
}

class GaragePresenter {
    
    let garageService = CarService()
    var delegate: GaragePresenterDelegate?
    
    func setViewDelegate(reference: GaragePresenterDelegate) {
        self.delegate = reference
    }
    
    func getBrand() {
        
        let service = garageService
        var object = [CarBrand]()
        
        service.getBrand { (response) in
            if let brandResponse = response {
                if !brandResponse.codigo.isEmpty, !brandResponse.nome.isEmpty {
                    object.append(brandResponse)
                }
            }
            self.delegate?.provideBrandContent(object: object)
        }
    }
    
    func getTemplate() {
        
        let service = garageService
        var object = [CarTemplate]()
        
        service.getTemplate { (response) in
            if let templateResponse = response {
                for template in templateResponse.modelos {
                    if template.codigo != 0, !template.nome.isEmpty {
                        object.append(templateResponse)
                    }
                }
            }
            self.delegate?.provideTemplateContent(object: object)
        }
        
    }
    
    func getYear() {
        
        let service = garageService
        var object = [CarYear]()
        
        service.getYear { (response) in
            if let yearResponse = response {
                if !yearResponse.nome.isEmpty, !yearResponse.codigo.isEmpty{
                    object.append(yearResponse)
                }
            }
            self.delegate?.provideYearContent(object: object)
        }
        
    }
    
    func getValue() {
        
        let service = garageService
        var object = [CarValue]()
        
        service.getValue { (response) in
            if let valueResponse = response {
                if !valueResponse.Valor.isEmpty, !valueResponse.Marca.isEmpty, !valueResponse.Modelo.isEmpty, valueResponse.AnoModelo != 0, !valueResponse.Combustivel.isEmpty, !valueResponse.CodigoFipe.isEmpty, !valueResponse.MesReferencia.isEmpty, valueResponse.TipoVeiculo != 0, !valueResponse.SiglaCombustivel.isEmpty {
                    object.append(valueResponse)
                }
            }
            self.delegate?.provideValueContent(object: object)
        }
        
    }
}
