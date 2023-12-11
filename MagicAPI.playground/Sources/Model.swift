
struct MagicCard: Decodable {
    let name: String
    let manaCost: {Int}
    let type: String
    let imageUrl: String
    let originalText: String?
}
