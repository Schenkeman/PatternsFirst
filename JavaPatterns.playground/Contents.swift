import UIKit
import Foundation

let weatherData = WeatherData()

let sation = WeatherStation(data: weatherData)

weatherData.setMeasurements(temperature: 23, humidity: 67, pressure: 756)
weatherData.setMeasurements(temperature: 25, humidity: 65, pressure: 760)


let string = "The rain in Spain"
let range = string.range(of: "rain", options: [.caseInsensitive, .backwards])


struct UserRoles: OptionSet {
    let rawValue: Int
    static let write = UserRoles(rawValue: 1 << 0)
    static let destroy = UserRoles(rawValue: 1 << 1)
}

let role1 = UserRoles([.destroy, .write])



let espresso = Espresso()
let milkCoffe = MilkDecorator(beverage: ChocolateDecorator(beverage: espresso))


milkCoffe.getCost()
milkCoffe.getDescription()











