struct CarTemplate: Codable {
    let name: String
    let code: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "nome"
        case code = "codigo"
    }
}
