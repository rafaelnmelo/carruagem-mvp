struct CarData: Codable {
    let name: String
    let code: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "nome"
        case code = "codigo"
    }
}

struct CarTemplate: Codable {
    let template: [CarData]
    
    enum CodingKeys: String, CodingKey {
        case template = "modelos"
    }
}
