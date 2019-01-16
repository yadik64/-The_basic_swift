import UIKit

func roundingToTwoDecimalPlaces(_ number: Double) -> Double {
    return round(number * 100) / 100
}
// Перечисление описывающее деяствия над автомобилем
enum ActionCars {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadCargo(weight: Double)
    case unloadCargo(weight: Double)
    case unloadAll
}

// Структура описывающая легковой автомобиль
struct PassengerCar {
// Перечисления типов кузова легкового автомобиля
    enum CarBodyTypes {
        case sedan
        case coupe
        case hatchback
        case stationWagon
        case pickupTruck
        case van
        case minivan
        case offRoadCar
        case crossover
    }
    
    let brand: String
    let carBodyTyples: CarBodyTypes
    let yearOfIssue: Int
    let trunkCapacity: Double
    private var engineStateIs: Bool = false {
        didSet {
            if overload {
                engineStateIs = false
                print("Автомобиль перегружен на \(roundingToTwoDecimalPlaces(trunkIsFullOn - trunkCapacity)) кг.\nДвижение не возможно! ")
            }
        }
    }
    var trunkIsFullOn: Double = 0 {
        didSet {
            if trunkIsFullOn > trunkCapacity {
                overload = true
            } else {
                overload = false
            }
            if trunkIsFullOn == 0 {
                print("Багажник пуст")
            }
        }
    }
    private var windowsStateIs: Bool = false
    private var overload: Bool = false
    
    init(brand: String, carBodyTyples: CarBodyTypes, yearOfIssue: Int, trunkCapacity: Double) {
        self.brand = brand
        self.carBodyTyples = carBodyTyples
        self.yearOfIssue = yearOfIssue
        self.trunkCapacity = trunkCapacity
    }
    
    mutating func controlCar(_ action: ActionCars) {
        switch action {
        case .startEngine:
            engineStateIs = true
            if engineStateIs {
                print("Двигатель заведен.")
            }
        case .stopEngine:
            engineStateIs = false
            print("Двигатель заглушен.")
        case .openWindows:
            windowsStateIs = true
            print("Окна открыты")
        case .closeWindows:
            windowsStateIs = false
            print("Окна закрыты")
        case let .loadCargo (weight):
            trunkIsFullOn += weight
        case let .unloadCargo (weight):
            if trunkIsFullOn == 0 {
                print("Нечего брать.")
            } else if trunkIsFullOn - weight < 0 {
                print ("Было выгружено только \(roundingToTwoDecimalPlaces(trunkIsFullOn)) кг.")
                trunkIsFullOn -= trunkIsFullOn
            } else {
                trunkIsFullOn -= weight
                print("В багажнике \(roundingToTwoDecimalPlaces(trunkIsFullOn)) кг.")
            }
        case .unloadAll:
            print ("Выгружено \(roundingToTwoDecimalPlaces(trunkIsFullOn)) кг.")
            trunkIsFullOn -= trunkIsFullOn
            
        }
    }
}

var coupeBMW = PassengerCar(brand: "BMW", carBodyTyples: .coupe, yearOfIssue: 2019, trunkCapacity: 500)
coupeBMW.controlCar(.loadCargo(weight: 400))
coupeBMW.controlCar(.unloadAll)
coupeBMW.controlCar(.loadCargo(weight: 550))
coupeBMW.controlCar(.startEngine)
coupeBMW.controlCar(.openWindows)

print("------------------------------------")

var sedanVolvo = PassengerCar(brand: "Volvo", carBodyTyples: .sedan, yearOfIssue: 2017, trunkCapacity: 400)
sedanVolvo.controlCar(.closeWindows)
sedanVolvo.controlCar(.loadCargo(weight: 350))
sedanVolvo.controlCar(.startEngine)
// Структура описывающая грузовой автомобиль
struct Truck {
    let brand: String
    let yearOfIssue: Int
    let loadCapacity: Double
    var cargoWeight: Double = 0 {
        didSet {
            if cargoWeight > loadCapacity {
                overload = true
            } else {
                overload = false
            }
        }
    }
    private var engineStateIs: Bool = false {
        didSet {
            if overload {
                engineStateIs = false
                print("Автомобиль перегружен на \(roundingToTwoDecimalPlaces(cargoWeight - loadCapacity)) кг.\nДвижение невозможно.")
            }
        }
    }
    private var windowsStateIs: Bool = false
    private var overload: Bool = false
    
    init(brand: String, yearOfIssue: Int, loadCapacity: Double) {
        self.brand = brand
        self.yearOfIssue = yearOfIssue
        self.loadCapacity = loadCapacity
    }
    
    mutating func controlCar(_ action: ActionCars) {
        switch action {
        case .startEngine:
            self.engineStateIs = true
            if self.engineStateIs {
                print("Двигатель заведен.")
            }
        case .stopEngine:
            self.engineStateIs = false
            print("Двигатель заглушен.")
        case .openWindows:
            self.windowsStateIs = true
            print("Окна открыты.")
        case .closeWindows:
            self.windowsStateIs = false
            print("Окна закрыты.")
        case let .loadCargo (weight):
            self.cargoWeight += weight
        case let .unloadCargo (weight):
            if self.cargoWeight == 0 {
                print("Нечего брать.")
            } else if self.cargoWeight - weight < 0 {
                print ("Было выгружено только \(roundingToTwoDecimalPlaces(self.cargoWeight)) кг.")
                self.cargoWeight -= self.cargoWeight
            } else {
                self.cargoWeight -= weight
                print("В кузове \(roundingToTwoDecimalPlaces(self.cargoWeight)) кг.")
            }
        case .unloadAll:
            print ("Выгружено \(roundingToTwoDecimalPlaces(cargoWeight)) кг.")
            self.cargoWeight -= cargoWeight
        }
        
    }
}

print("------------------------------------")

var truckMan = Truck(brand: "Man", yearOfIssue: 2013, loadCapacity: 15_000)
truckMan.controlCar(.loadCargo(weight: 500))
truckMan.controlCar(.unloadCargo(weight: 400))
truckMan.controlCar(.closeWindows)
truckMan.controlCar(.startEngine)

print("------------------------------------")

var truckScania = Truck(brand: "Scania", yearOfIssue: 2018, loadCapacity: 20_000)
truckScania.controlCar(.loadCargo(weight: 15_000.345334))
truckScania.controlCar(.unloadCargo(weight: 20_000))
truckScania.controlCar(.loadCargo(weight: 30_000))
truckScania.controlCar(.startEngine)
