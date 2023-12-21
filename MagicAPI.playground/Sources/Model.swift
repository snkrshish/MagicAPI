struct Card: Codable {
    let cards : [CardElement]
}


struct CardElement: Codable {
    let name: String
    let manaCost: String?
    let rarity: String
    let setName: String
    let text: String
    let artist: String
}
