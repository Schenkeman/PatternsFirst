import Foundation

public protocol QuackBehavior {
    func quack()
}

public protocol FlyBehavior {
    func fly()
}

public class QuackingDefolt: QuackBehavior {
    public func quack() {
        print("QUAAAA")
    }
}

public class FlyingDefolt: FlyBehavior {
    public func fly() {
        print("FLYYYY")
    }
}


public class Duck {
    public var flyBehavior: FlyBehavior?
    public var quackBehavior: QuackBehavior?
    
    public func performQuack() {
        guard let quack = quackBehavior else { return }
        quack.quack()
    }
    
    public func performFly() {
        guard let fly = flyBehavior else { return }
        fly.fly()
    }
    
    public func setFlyBehavior(fb: FlyBehavior) {
        self.flyBehavior = fb
    }
    
    public func setQuackBehavior(qb: QuackBehavior) {
        self.quackBehavior = qb
    }
}
    

public class MallardDuck: Duck {
    override init() {
        super.init()
        self.quackBehavior = QuackingDefolt()
        self.flyBehavior = FlyingDefolt()
    }
}



