import Foundation


//MARK:- Protocols

protocol Subject {
    func registerObserver(_ : Observer)
    func removeObserver(_ : Observer)
    func notifyObservers()
}

protocol Observer: class {
    func update(temperature: Int, humidity: Int, pressure: Int)
}

protocol ViewController {
    var viewControllerDidLoad: ViewDidLoad { get set }
    func display()
}

class ViewDidLoad {
    func viewDidLoad() {
        print("it is loaded")
    }
}

//MARK:- WeatherData

public class WeatherData: Subject {

    var temperature: Int = 0
    var humidity: Int = 0
    var pressure: Int = 0
    lazy var observers: [Observer] = []
    
    public init() {
        
    }
    
    func registerObserver(_ o: Observer) {
        observers.append(o)
    }
    
    func removeObserver(_ o: Observer) {
        if let index = observers.firstIndex(where: { $0 === o }) {
            observers.remove(at: index)
        }
    }
    
    func notifyObservers() {
        for o in observers {
            o.update(temperature: temperature, humidity: humidity, pressure: pressure)
        }
    }
    
    func measurementsChanged() {
        notifyObservers()
    }
    
    public func setMeasurements(temperature: Int, humidity: Int, pressure: Int) {
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
        measurementsChanged()
    }
}

//MARK:- WeatherStation

public class WeatherStation {
//    var humiditySensor: SensorDevice?
//    var temperatureSensor: SensorDevice?
//    var pressureSensor: SensorDevice?
    var data: WeatherData
    
    public init(data: WeatherData) {
        self.data = data
        data.registerObserver(currentConditionViewController)
    }
    
    lazy var currentConditionViewController = CurrentConditionViewController(data: data)
}

//MARK:- CurrentCondition

public class CurrentConditionViewController: ViewController, Observer {
    
    var viewControllerDidLoad: ViewDidLoad = ViewDidLoad()
    
    private var temperature: Int = 0
    private var humidity: Int = 0
    private var pressure: Int = 0
    private var weatherData: WeatherData
    
    public func update(temperature: Int, humidity: Int, pressure: Int) {
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
        display()
    }
    
    init(data: WeatherData) {
        self.weatherData = data
    }
    
    public func display() {
        print("Current temperature is \(temperature), humidity is \(humidity), pressure is \(pressure)")
    }
   
    
}

//class WeatherStatsViewController: ViewController {
//    var viewControllerDidLoad: ViewDidLoad = ViewDidLoad()
//
//}
//
//class ForecastViewController: ViewController {
//    var viewControllerDidLoad: ViewDidLoad = ViewDidLoad()
//
//}

public protocol SensorDevice {
    func getDataForStation()
}


class HumiditySensorDevice: SensorDevice {
    func getDataForStation() {
        print("ff")
    }
    
    
}

class TemperatureSensorDevice: SensorDevice {
    func getDataForStation() {
        print("ff")
    }
    
    
}

class PressureSensorDevice: SensorDevice {
    func getDataForStation() {
        print("ff")
    }
}
