import Alamofire

public enum Endpoint {
    case fetchCarModel
    case fetchCarYear(modelCode: String)
    case fetchCarDetail(modelCode: String, yearCode: String)
    
    var rawValue: String {
        switch self {
        case .fetchCarModel:
            return BaseURL.domain + "/59/modelos"
        case let .fetchCarYear(modelCode):
            return BaseURL.domain + "/59/modelos/\(modelCode)/anos"
        case let .fetchCarDetail(modelCode, yearCode):
            return BaseURL.domain + "/59/modelos/\(modelCode)/anos/\(yearCode)"
        }
    }
}

public struct BaseURL {
    static var domain = "https://parallelum.com.br/fipe/api/v1/carros/marcas"
}

/// Resposta de um método que pode resultar em falha ou sucesso
public enum Result<T> {
    case success(T)
    case failure(ResponseError)
}
