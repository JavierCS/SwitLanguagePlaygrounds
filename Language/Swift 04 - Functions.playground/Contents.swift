///Functions are self-contained chunks of code that perform a specific task.

print("\n==============================")
print("Defining and Calling Functions")
print("==============================\n")
//MARK: - Defining and Calling Functions
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))
print(greet(person: "Brian"))

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}

print(greetAgain(person: "Anna"))

print("\n=====================================")
print("Function Parameters and Return Values")
print("=====================================\n")
//MARK: - Function Parameters and Return Values
///Function parameters and return values are extremely flexible in Swift. You cand define anything from a simple utility function with a single unnamed parameter to a complex function with expressive parameter names and different parameter options

    //MARK: Functions Without Parameters
func sayHelloWorld() -> String {
    return "Hello, world"
}

print(sayHelloWorld())

    //MARK: Functions With Multiple Parameters
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(greet(person: "Tim", alreadyGreeted: true))

    //MARK: Functions Without Return Values
func greetWithoutReturnAValue(person: String) {
    print("Hello, \(person)")
}

greetWithoutReturnAValue(person: "Dave")

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "Hello, world")
printWithoutCounting(string: "Hello, world")

    //MARK: Functions with Multiple Return Values
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 109, 3 ,71])
print("min is \(bounds.min) and max is \(bounds.max)")

    //MARK: Optional Tuple Return Types
func optionalMinMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let optionalBounds = optionalMinMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(optionalBounds.min) and max is \(optionalBounds.max)")
}

//MARK: Functions With an Implicit Return
func implicitGreeting(for person: String) -> String {
    "Hello, " + person + "!"
}

print(implicitGreeting(for: "Dave"))

print("\n============================================")
print("Function Argument Labels and Parameter Names")
print("============================================\n")
//MARK: - Function Argument Labels and Parameter Names
    // By default, parameters use ther parameter name as ther argument label

func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // In The function body, firstParameterName and secondParameterName refer to the argument values for the first and second parameters.
}
someFunction(firstParameterName: 1, secondParameterName: 2)

    //MARK: Specifying Argument Labels
func someFunction(argumentLabel parameterName: Int) {
    // In the functionbody, parameterName refers to the argument value for that parameter.
}
someFunction(argumentLabel: 1)

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))

    //MARK: Omitting Argument Labels
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName refer to the argument values for the first and second parameters
}
someFunction(1, secondParameterName: 2)

    //MARK: Default Parameter Values
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then the value of parameterWithDefault is 12 insed the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12

    //MARK: Variadic Parameters
    /// A variadic parameter accepts zero or more values of a specified type. You use a variadic parameter to specify that the parameter can be passed a varying number of input values when the function is called.

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print(arithmeticMean(1, 2, 3, 4, 5))
print(arithmeticMean(3, 8.25, 18.75))

    //MARK: In-Out Parameters
/// Function parameters are constants by default. Trying to change the value of a function parameter from within the body of that function result in a compile-time error. So you can define that parameter as an in-out parameter.

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107

swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


print("\n==============")
print("Function Types")
print("==============\n")
//MARK: - Function Types
    /// Every function has a specific function type, made up of the parameter types and the return type of the function

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
} // It's func has the function type (Int, Int) -> Int

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
} // It's function also has the function type (Int, Int) -> Int

var mathFunction: (Int, Int) -> Int
// This var also has the function type (Int, Int) -> Int

mathFunction = addTwoInts(_:_:)
var result = mathFunction(2,3)
print("The result value is \(result) because mathFunction is equal to addTwoInts(_:_:)")

mathFunction = multiplyTwoInts(_:_:)
result = mathFunction(2,3)
print("The result value is \(result) because mathFunction is equal to multiplyTwoInts(_:_:)")

//MARK: Function types as Parameter Types
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(mathFunction, 3, 5)

//MARK: Function Types as Return Types
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
var moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

//MARK: - Nested Functions
/// Functions defined inside the bodies of other functions
func chooseNestedStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}

currentValue = -4
moveNearerToZero = chooseNestedStepFunction(backward: currentValue > 0)

while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

