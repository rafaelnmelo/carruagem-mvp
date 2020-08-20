struct CarYear: Codable {
    let name: String
    let code: String
    
    enum CodingKeys: String, CodingKey {
        case name = "nome"
        case code = "codigo"
    }
}
