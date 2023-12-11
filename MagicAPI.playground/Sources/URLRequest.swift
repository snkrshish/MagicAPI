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

        if let data = data, let dataAsString = String(data: data, encoding: .utf8) {
            print(" Данные с сервера: \(dataAsString)")
        } else {
            print("Данные не могут быть загружены или конвертированы в текстовый формат")
        }

    }.resume()
}
