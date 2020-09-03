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
    
    
    func carTemplateService(to endpoint: String, callback: @escaping (Result<CarTemplate>) -> Void ) {
        
        self.networkManager.getFromServer(by: endpoint) { response in
            switch response.result {
            case .success:
                let decoder = JSONDecoder()
                guard let jsonData = response.data, let _ = response.value, let carBrand = try?  decoder.decode(CarTemplate.self, from: jsonData) else {
                    callback(.failure(.decodeError))
                    return
                }
                callback(.success(carBrand))
            case .failure:
                callback(.failure(.dataNotFound))
            }
        }
    }
}
