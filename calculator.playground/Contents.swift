//LV.2
/*class Calculator {
    
    func add(a:Double, b:Double) -> Double {
        return a + b
    }
    
    func subtract(a:Double, b:Double) -> Double {
        return a - b
    }
    
    func multiply(a:Double, b:Double) -> Double {
        return a * b
    }
    
    func divide(a:Double, b:Double) -> Double {
        if b == 0 {
            return 0
        } else {
            return a / b
        }
    }
    
    func remainder(a:Double, b:Double) -> Double {
        return a.truncatingRemainder(dividingBy: b)
    }
    
    
}
let calculator = Calculator()
let addResult = calculator.add(a: 10, b: 7)
let subtractResult = calculator.subtract(a: 10, b: 7)
let multiplyResult = calculator.multiply(a: 10, b: 15)
let divideResult = calculator.divide(a: 20, b: 6)
let remainderResult = calculator.remainder(a: 30, b: 7) */


//LV.3

/*class Calculator {
    var firstnumber: Double
    var secondnumber: Double
    
    init(firstnumber: Double, secondnumber: Double) {
        self.firstnumber = firstnumber
        self.secondnumber = secondnumber
        
    
    }
    
    func operation()-> Double{
        return 0
    }
    
}

class Addoperation: Calculator {
    override func operation() -> Double {
        return firstnumber + secondnumber
    }
}

class SubtractOperation: Calculator {
    override func operation() -> Double {
        return firstnumber - secondnumber
    }
}

    
class MultiplyOperation: Calculator {
    override func operation() -> Double {
        return firstnumber * secondnumber
    }
}


class DivideOperation: Calculator {
    override func operation() -> Double {
        if secondnumber != 0 {
            return firstnumber / secondnumber
        } else {
            return 0
        }
    }
}


let addResult = Addoperation(firstnumber: 10, secondnumber: 20)
let subtractResult = SubtractOperation(firstnumber: 10, secondnumber: 20)
let multiplyResult = MultiplyOperation(firstnumber: 10, secondnumber: 20)
let divideResult = DivideOperation(firstnumber: 30, secondnumber: 6)

print(addResult.operation())
print(subtractResult.operation())
print(multiplyResult.operation())
print(divideResult.operation()) */


//LV.4

protocol AbstractOperation {
    var firstnumber: Double {get}
    var secondnumber: Double {get}
    
    func operation() -> Double
}

class Calculator {
    let operation: AbstractOperation
    
    init(operation: AbstractOperation) {
        self.operation = operation
        
    
    }
    
    func operate()-> Double{
        operation.operation()
        return 0
    }
    
}

class Addoperation: AbstractOperation {
   
    var firstnumber: Double
    var secondnumber: Double
    
    init(firstnumber: Double, secondnumber: Double) {
        self.firstnumber = firstnumber
        self.secondnumber = secondnumber
    }
    
    func operation() -> Double {
        return firstnumber + secondnumber
    }
}


class SubtractOperation: AbstractOperation {
    
    var firstnumber: Double
    var secondnumber: Double
    
    init(firstnumber: Double, secondnumber: Double) {
        self.firstnumber = firstnumber
        self.secondnumber = secondnumber
    }
    
    func operation() -> Double {
        return firstnumber - secondnumber
    }
}

    
class MultiplyOperation: AbstractOperation {
    var firstnumber: Double
    var secondnumber: Double
    
    init(firstnumber: Double, secondnumber: Double) {
        self.firstnumber = firstnumber
        self.secondnumber = secondnumber
    }
    
    func operation() -> Double {
        return firstnumber * secondnumber
    }
}



class DivideOperation: AbstractOperation {
    var firstnumber: Double
    var secondnumber: Double
    
    init(firstnumber: Double, secondnumber: Double) {
        self.firstnumber = firstnumber
        self.secondnumber = secondnumber
    }
    
    func operation() -> Double {
        if secondnumber != 0 {
            return firstnumber / secondnumber
        } else {
            return 0
        }
    }
    
}
    
    let addResult = Addoperation(firstnumber: 10, secondnumber: 20)
    let subtractResult = SubtractOperation(firstnumber: 10, secondnumber: 20)
    let multiplyResult = MultiplyOperation(firstnumber: 10, secondnumber: 20)
    let divideResult = DivideOperation(firstnumber: 30, secondnumber: 6)
    
    print(addResult.operation())
    print(subtractResult.operation())
    print(multiplyResult.operation())
    print(divideResult.operation())
    
    

