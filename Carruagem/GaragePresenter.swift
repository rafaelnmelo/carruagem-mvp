import Foundation
// Herdar de AnyObject fará com que apenas classes possam ser criadas conforme este protocolo. Obs.: class está deprecated
protocol GaragePresenterDelegate: AnyObject {
    func provideBrandContent(object: [CarBrand])
    func provideTemplateContent(object: [CarTemplate])
    func provideYearContent(object: [CarYear])
    func provideValueContent(object: [CarValue])
}

class GaragePresenter {
    
    let garageService: CarService
    weak var delegate: GaragePresenterDelegate?
    // weak em delegate evita memory leak pois evita retenção de ciclos
    
    func setViewDelegate(reference: GaragePresenterDelegate) {
        self.delegate = reference
    }
    
    init(garageService: CarService) {
        self.garageService = garageService
    }
    
    func getBrand() {

        var object = [CarBrand]()
        
        garageService.getBrand { response in
            if let brandResponse = response {
                if !brandResponse.codigo.isEmpty, !brandResponse.nome.isEmpty {
                    object.append(brandResponse)
                }
            }
            self.delegate?.provideBrandContent(object: object)
        }
    }
    
    func getTemplate() {

        var object = [CarTemplate]()
        
        garageService.getTemplate { response in
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

        var object = [CarYear]()
        
        garageService.getYear { response in
            if let yearResponse = response {
                if !yearResponse.nome.isEmpty, !yearResponse.codigo.isEmpty{
                    object.append(yearResponse)
                }
            }
            self.delegate?.provideYearContent(object: object)
        }
        
    }
    
    func getValue() {

        var object = [CarValue]()
        
        garageService.getValue { response in
            if let valueResponse = response {
                if !valueResponse.Valor.isEmpty, !valueResponse.Marca.isEmpty, !valueResponse.Modelo.isEmpty, valueResponse.AnoModelo != 0, !valueResponse.Combustivel.isEmpty, !valueResponse.CodigoFipe.isEmpty, !valueResponse.MesReferencia.isEmpty, valueResponse.TipoVeiculo != 0, !valueResponse.SiglaCombustivel.isEmpty {
                    object.append(valueResponse)
                }
            }
            self.delegate?.provideValueContent(object: object)
        }
        
    }
}
