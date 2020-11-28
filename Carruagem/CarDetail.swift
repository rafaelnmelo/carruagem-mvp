struct CarDetail: Codable {
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
            case value = "Valor"
            case brand = "Marca"
            case model = "Modelo"
            case modelYear = "AnoModelo"
            case fuel = "Combustivel"
            case fipeCode = "CodigoFipe"
            case referenceMonth = "MesReferencia"
            case vehicleType = "TipoVeiculo"
            case fuelInitials = "SiglaCombustivel"
    }
}
