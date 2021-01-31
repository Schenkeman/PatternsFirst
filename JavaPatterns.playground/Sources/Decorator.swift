import Foundation

public protocol Beverage {
    func getDescription() -> String
    func getCost() -> Int
}

public class CondimentDecorator: Beverage {
    
    private var beverage: Beverage
    
    public init(beverage: Beverage) {
        self.beverage = beverage
    }
    
    public func getDescription() -> String {
        beverage.getDescription()
    }
    
    public func getCost() -> Int {
        beverage.getCost()
    }
}

public final class Espresso: Beverage {
    public init() {

    }
    
    public func getDescription() -> String {
         return "Espresso"
    }
    
    public func getCost() -> Int {
        return 100
    }
}

public class HouseBlend: Beverage {
    public init() {

    }
    
    public func getDescription() -> String {
        return "House Blend"
    }
    
    public func getCost() -> Int {
        return 125
    }
}

public class MilkDecorator: CondimentDecorator {
    public override func getCost() -> Int {
        super.getCost() + 23
    }
    public override func getDescription() -> String {
        super.getDescription() + " + Milk"
    }
}

public class ChocolateDecorator: CondimentDecorator {
    public override func getCost() -> Int {
        super.getCost() + 33
    }
    public override func getDescription() -> String {
        super.getDescription() + " + Chocolate"
    }
}

