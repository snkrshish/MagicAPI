import Foundation


if let blackLotusCards = createURL(card: "Black Lotus"), let optCards = createURL(card: "opt"){
    getData(urlRequest: "\(blackLotusCards)")
    getData(urlRequest: "\(optCards)")
} else {
    print("ошибочка")
}
