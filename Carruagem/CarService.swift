import Alamofire
import Foundation

public enum ResponseError: Error {
    case internetError
    case decodeError
    case dataNotFound
}

final class CarBrandService {
        
    func carBrandService(to endpoint: String, callback: @escaping (Result<CarTemplate>) -> Void ) {
        
        AF.request(endpoint).response { response in
            print(response)
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
