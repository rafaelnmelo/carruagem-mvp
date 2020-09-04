import UIKit
/// Herdar de AnyObject fará com que apenas classes possam ser criadas conforme este protocolo. Obs.: class está deprecated
protocol GaragePresenterDelegate: AnyObject {
    func fetchSuccess()
}

class GaragePresenter {
    
    private let garageService: CarTemplateService
    weak var delegate: GaragePresenterDelegate? /// weak em delegate evita memory leak pois evita retenção de ciclos
    var carData = [CarData]()
    
    init(garageService: CarTemplateService = CarTemplateService()) {
        self.garageService = garageService
    }
    
    func getCarTemplate(by code: String) {
        self.garageService.carTemplateService(to: Endpoint.fetchCarTemplate(code: code).rawValue) { response in
            
            switch response{
            case .success(let carTemplate):
                self.objectMapper(carTemplate: carTemplate)
                self.delegate?.fetchSuccess()
                break
            case .failure:
                break
            }
            
        }
    }
    
    func objectMapper(carTemplate: CarTemplate) {
        let carDataFilter = carTemplate.template.filter {
            $0.name.isEmpty == false
        }
        for value in carDataFilter {
            carData.append(value)
        }
    }
    
    func numberOfRows() -> Int{
        return carData.count
    }
    
    func cellForRow(at indexPath: IndexPath) -> GenericCellTableViewCell.Data{
        let data = GenericCellTableViewCell.Data(name: carData[indexPath.row].name, code: "\(carData[indexPath.row].code)")
        return data
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

