import UIKit

struct CarTemplate: Codable {
    let modelos: [CarModel]
}

struct CarModel: Codable {
    let nome: String
    let codigo: Int
}
