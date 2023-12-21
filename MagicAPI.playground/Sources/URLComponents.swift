import Foundation

public func createURL(card: String) -> URL? {
    var urlComponents = URLComponents()
    urlComponents.scheme = "https"
    urlComponents.host = "api.magicthegathering.io"
    urlComponents.path = "/v1/cards"
    urlComponents.queryItems = [URLQueryItem(name: "name", value: card)]

    return urlComponents.url
}
