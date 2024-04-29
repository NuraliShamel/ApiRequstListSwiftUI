import Foundation

struct Asset: Identifiable, Codable {
    let id: String
    let symbol: String
    let priceUsd: String
}

struct AssetResponse: Codable {
    let data: [Asset]
}
