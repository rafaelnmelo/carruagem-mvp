struct CarTemplate: Codable {
    let model: [CarModel]
    
    enum CodingKeys: String, CodingKey {
        case model = "modelos"
    }
}

struct CarModel: Codable {
    let name: String
    let code: String
    
    enum CodingKeys: String, CodingKey {
        case name = "nome"
        case code = "codigo"
    }
}
