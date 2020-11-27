import Alamofire
import Foundation

public enum ResponseError: Error {
    case internetError
    case decodeError
    case dataNotFound
}

final class CarTemplateService {
    
    let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    
    func carModelService(to endpoint: String, callback: @escaping (Result<CarModel>) -> Void ) {
        
        self.networkManager.getFromServer(by: endpoint) { response in
            switch response.result {
            case .success:
                let decoder = JSONDecoder()
                guard let jsonData = response.data, let _ = response.value, let carModel = try?  decoder.decode(CarModel.self, from: jsonData) else {
                    callback(.failure(.decodeError))
                    return
                }
                callback(.success(carModel))
            case .failure:
                callback(.failure(.dataNotFound))
            }
        }
    }
    
    func carYearService(to endpoint: String, callback: @escaping (Result<[ManufactureYear]>) -> Void ) {
        
        self.networkManager.getFromServer(by: endpoint) { response in
            switch response.result {
            case .success:
                let decoder = JSONDecoder()
                guard let jsonData = response.data, let _ = response.value, let manufactureYear = try?  decoder.decode([ManufactureYear].self, from: jsonData) else {
                    callback(.failure(.decodeError))
                    return
                }
                callback(.success(manufactureYear))
            case .failure:
                callback(.failure(.dataNotFound))
            }
        }
    }
    
    func carDetailService(to endpoint: String, callback: @escaping (Result<CarDetail>) -> Void ) {
        
        self.networkManager.getFromServer(by: endpoint) { response in
            switch response.result {
            case .success:
                let decoder = JSONDecoder()
                guard let jsonData = response.data, let _ = response.value, let carDetail = try?  decoder.decode(CarDetail.self, from: jsonData) else {
                    callback(.failure(.decodeError))
                    return
                }
                callback(.success(carDetail))
            case .failure:
                callback(.failure(.dataNotFound))
            }
        }
    }
}
