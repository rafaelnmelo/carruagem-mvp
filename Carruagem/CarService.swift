import UIKit
import Alamofire

class CarService {
    
    func getBrand(callback: @escaping (CarBrand?) -> Void) {
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas").response { response in
            guard let content = response.data, let brand = try? JSONDecoder().decode(CarBrand.self, from: content) else {
                callback(nil)
                return
            }
            callback(brand)
        }
    }
    
    func getTemplate(callback: @escaping (CarTemplate?) -> Void) {
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas/59/modelos").response { response in
            guard let content = response.data, let template = try? JSONDecoder().decode(CarTemplate.self, from: content) else {
                callback(nil)
                return
            }
            callback(template)
        }
        
    }
    
    func getYear(callback: @escaping (CarYear?) -> Void) {
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas/59/modelos/5940/anos").response { response in
            guard let content = response.data, let year = try? JSONDecoder().decode(CarYear.self, from: content) else {
                 callback(nil)
                 return
             }
             callback(year)
         }
        
    }
    
    func getValue(callback: @escaping (CarValue?) -> Void) {
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas/59/modelos/5940/anos/2014-3").response { response in
             guard let content = response.data, let carValue = try? JSONDecoder().decode(CarValue.self, from: content) else {
                 callback(nil)
                 return
             }
             callback(carValue)
         }
        
    }
}
