struct CarValue: Codable {
    let value: String
    let brand: String
    let model: String
    let modelYear: Int
    let fuel: String
    let fipeCode: String
    let referenceMonth: String
    let vehicleType: Int
    let fuelInitials: String
    
    private enum CodingKeys: String, CodingKey {
            case value = "valor"
            case brand = "marca"
            case model = "modelo"
            case modelYear = "anoModelo"
            case fuel = "combustivel"
            case fipeCode = "codigoFipe"
            case referenceMonth = "mesReferencia"
            case vehicleType = "tipoVeiculo"
            case fuelInitials = "siglacombustivel"
    }
}
