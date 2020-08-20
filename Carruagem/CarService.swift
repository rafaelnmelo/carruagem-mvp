import Alamofire

class CarService {
    
    typealias AlamofireJSONCallback = (Result<Any>)->()
    
    enum AlamofireJSONClient {
        
        static func getAPICall(to endpoint: CarEndPoint, callback: @escaping AlamofireJSONCallback) {
            AF.request(endpoint.url, method: endpoint.httpMethod, parameters: endpoint.parameters, encoding: endpoint.encoding).validate().responseJSON { response in
                switch response.result {
                case .success(let value):
                    callback(Result.success(value))
                case .failure(let error):
                    callback(Result.failure(error))
                }
            }
        }
    }
}
