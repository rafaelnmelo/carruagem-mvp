import Alamofire

//protocol CarEndPoint {
//    /// Nutre as informações necessárias para fazer a chamada na API
//    func provideValues()-> (url: String, httpMethod: HTTPMethod, parameters:[String:Any]?,encoding: ParameterEncoding)
//
//    var url: URLConvertible         { get }
//    var httpMethod: HTTPMethod      { get }
//    var parameters: [String: Any]?  { get }
//    var encoding: ParameterEncoding { get }
//}
//
//extension CarEndPoint {
//    var url: URLConvertible         { return provideValues().url }
//    var httpMethod: HTTPMethod      { return provideValues().httpMethod }
//    var parameters: [String: Any]?  { return provideValues().parameters }
//    var encoding: ParameterEncoding { return provideValues().encoding }
//}

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
            return BaseURL.domain + "/59)/modelos/\(modelCode)/anos/\(yearCode)"
        }
    }
}

public struct BaseURL {
    static var domain = "https://parallelum.com.br/fipe/api/v1/carros/marcas"
}
