//
//  CarService.swift
//  Carruagem
//
//  Created by Rafael Nunes on 12/08/20.
//  Copyright © 2020 Rafael Nunes. All rights reserved.
//

import UIKit

class CarsServices {
    
    func getBrands(onComplete: @escaping (CarsBrands?) -> Void) {
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas").response { response in
            guard let content = response.data, let brands = try? JSONDecoder().decode(CarsBrands.self, from: content) else {
                onComplete(nil)
                return
            }
            onComplete(brands)
        }
    }
    
    func getTemplate(onComplete: @escaping (CarsTemplates?) -> Void) {
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas/59/modelos").response { response in
            guard let content = response.data, let template = try? JSONDecoder().decode(CarsTemplates.self, from: content) else {
                onComplete(nil)
                return
            }
            onComplete(template)
        }
        
    }
    
    func getYears(onComplete: @escaping (CarsYears?) -> Void) {
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas/59/modelos/5940/anos").response { response in
            guard let content = response.data, let years = try? JSONDecoder().decode(CarsYears.self, from: content) else {
                 onComplete(nil)
                 return
             }
             onComplete(years)
         }
        
    }
    
    func getCarValue(onComplete: @escaping (CarsValues?) -> Void) {
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas/59/modelos/5940/anos/2014-3").response { response in
             guard let content = response.data, let carsValues = try? JSONDecoder().decode(CarsValues.self, from: content) else {
                 onComplete(nil)
                 return
             }
             onComplete(carsValues)
         }
        
    }
}
