/// Herdar de AnyObject fará com que apenas classes possam ser criadas conforme este protocolo. Obs.: class está deprecated
protocol GaragePresenterDelegate: AnyObject {
    func provideBrandContent(object: [CarBrand])
    func provideTemplateContent(object: [CarTemplate])
    func provideYearContent(object: [CarYear])
    func provideValueContent(object: [CarValue])
}

class GaragePresenter {
    
    private let garageService: CarBrandService
    weak var delegate: GaragePresenterDelegate? /// weak em delegate evita memory leak pois evita retenção de ciclos
    
    
    func setViewDelegate(reference: GaragePresenterDelegate) {
        self.delegate = reference
    }
    
    init(garageService: CarBrandService = CarBrandService()) {
        self.garageService = garageService
    }
    
    func getCarTemplate(by code: String) {
        self.garageService.carBrandService(to: Endpoint.fetchCarTemplate(code: code).rawValue) { response in
            switch response{
            case .success(let carBrand):
                break
            case .failure(let error):
                break
            }
            
        }
    }
//    
//    func getTemplate() {
//
//        var object = [CarTemplate]()
//        
//        garageService. { response in
//            if let templateResponse = response {
//                for template in templateResponse.model {
//                    if template.code.isEmpty, !template.name.isEmpty {
//                        object.append(templateResponse)
//                    }
//                }
//            }
//            self.delegate?.provideTemplateContent(object: object)
//        }
//        
//    }
//    
//    func getYear() {
//
//        var object = [CarYear]()
//        
//        garageService.getYear { response in
//            if let yearResponse = response {
//                if !yearResponse.name.isEmpty, !yearResponse.code.isEmpty{
//                    object.append(yearResponse)
//                }
//            }
//            self.delegate?.provideYearContent(object: object)
//        }
//        
//    }
//    
//    func getValue() {
//
//        var object = [CarValue]()
//        
//        garageService.getValue { response in
//            if let valueResponse = response {
//                if !valueResponse.value.isEmpty, !valueResponse.brand.isEmpty, !valueResponse.model.isEmpty, valueResponse.modelYear != 0, !valueResponse.fuel.isEmpty, !valueResponse.fipeCode.isEmpty, !valueResponse.referenceMonth.isEmpty, valueResponse.vehicleType != 0, !valueResponse.fuelInitials.isEmpty {
//                    object.append(valueResponse)
//                }
//            }
//            self.delegate?.provideValueContent(object: object)
//        }
//        
//    }
}
