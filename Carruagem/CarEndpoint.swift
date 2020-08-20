import Alamofire

protocol CarEndPoint {
    /// Nutre as informações necessárias para fazer a chamada na API
    func provideValues()-> (url: String, httpMethod: HTTPMethod, parameters:[String:Any]?,encoding: ParameterEncoding)
    
    var url: URLConvertible         { get }
    var httpMethod: HTTPMethod      { get }
    var parameters: [String: Any]?  { get }
    var encoding: ParameterEncoding { get }
}

extension CarEndPoint {
    var url: URLConvertible         { return provideValues().url }
    var httpMethod: HTTPMethod      { return provideValues().httpMethod }
    var parameters: [String: Any]?  { return provideValues().parameters }
    var encoding: ParameterEncoding { return provideValues().encoding }
}
