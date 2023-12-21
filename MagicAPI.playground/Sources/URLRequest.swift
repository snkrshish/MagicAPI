import Foundation

public func getData(urlRequest: String) {

    let urlRequest = URL(string: urlRequest)
    guard let url = urlRequest else {
        print("Неверный URL")
        return
    }

    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error {
            print("Ошибка: \(error.localizedDescription)")
        } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            print("Код ответа от сервера: \(response.statusCode)")
        } else {
            print("Не получили ответ от сервера")
        }
        
        guard let data = data else { return }

        do {
            let jsonDecoder = JSONDecoder()
            let magicCard = try jsonDecoder.decode(Card.self, from: data)

            let necessaryСards = magicCard.cards.filter { $0.name.lowercased() == "opt" || $0.name.lowercased() == "black lotus"}

            if necessaryСards.isEmpty {
                print("Карты не найдены")
            } else {
                for card in necessaryСards {
                    printCards(card: card)
                }
            }

        } catch {
            print("Ошибка \(error.localizedDescription)")
            debugPrint(error)
        }
    }.resume()
}


func printCards(card: CardElement) {
    print("""
        Имя карты: \(card.name)
        Мановая стоимость: \(card.manaCost ?? "N/A")
        Редкость: \(card.rarity)
        Название набора: \(card.setName)
        Текст на карте: \(card.text)
        Художник: \(card.artist)
        """)
}
