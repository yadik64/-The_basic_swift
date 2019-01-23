import UIKit

enum ActionCars {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case startNitro
    case stopNitro
    case activationSystemPlaton
    case deactivationSystemPlaton
}

class Car {
    
    enum Transmission {
        case auto
        case manual
    }
    
    enum Fuel {
        case diesel
        case petrol95
        case petrol92
        case gas
    }
    
    let brand: String
    let yearOfIssue: Int
    let numberOfDoors: Int
    let numberOfWheels: Int
    let transmission: Transmission
    var motorPower: Int
    var fuel: Fuel
    var engineStateIs: Bool = false {
        didSet {
            engineStateIs ? print("Двигатель запущен") : print("Двигатель заглушен")
        }
    }
    var windowsStateIs: Bool = false {
        didSet {
            windowsStateIs ? print("Окна открыты") : print("Окна закрыты")
        }
    }
    
    init(brand: String, yearOfIssue: Int, numberOfDoors: Int, numberOfWheels: Int, transmission: Transmission, motorPower: Int, fuel: Fuel) {
        self.brand = brand
        self.yearOfIssue = yearOfIssue
        self.numberOfDoors = numberOfDoors
        self.numberOfWheels = numberOfWheels
        self.transmission = transmission
        self.motorPower = motorPower
        self.fuel = fuel
    }
    
    func controlCar(_ action: ActionCars) { //??? А если допустим написать тут метод с перечислениями используя switch. В переопределенных методах все равно придется писать их заново, если нужно добавить например еще один case? super.controlCar() - в этом не поможет же? Или же все таки есть способ избежать тупого копирования кода???
    }
}

class SportCar: Car {
    
    var deflector: Bool
    var nitro: Bool = false {
        didSet {
            nitro ? print("Закись азота активированна") : print("Закись азота деактивированна")
        }
    }
    var carbonBody: Bool
    
    init(brand: String, yearOfIssue: Int, numberOfDoors: Int, numberOfWheels: Int, transmission: Transmission, motorPower: Int, fuel: Fuel, deflector: Bool, carbonBody: Bool) {
        self.deflector = deflector
        self.carbonBody = carbonBody
        super.init(brand: brand, yearOfIssue: yearOfIssue, numberOfDoors: numberOfDoors, numberOfWheels: numberOfWheels, transmission: transmission, motorPower: motorPower, fuel: fuel)
    }
    
    override func controlCar(_ action: ActionCars) {
        switch action {
        case .startEngine:
            self.engineStateIs = true
        case .stopEngine:
            self.engineStateIs = false
        case .openWindows:
            self.windowsStateIs = true
        case .closeWindows:
            self.windowsStateIs = false
        case .startNitro:
            self.nitro = true
        case .stopNitro:
            self.nitro = false
        default:
            break
        }
    }
    
}

class TrunkCar: Car {
    
    enum TypeTrunk {
        case tipper
        case wagon
        case autoTransporter
    }
    
    let typeTrunk: TypeTrunk
    var systemPlaton: Bool = true {
        didSet {
            systemPlaton ? print("Система \"Платон\" активна") : print("Система \"Платон\" отключена")
        }
    }
    
    
    init(brand: String, yearOfIssue: Int, numberOfDoors: Int, numberOfWheels: Int, transmission: Transmission, motorPower: Int, typeTrunk: TypeTrunk) {
        self.typeTrunk = typeTrunk
        super.init(brand: brand, yearOfIssue: yearOfIssue, numberOfDoors: numberOfDoors, numberOfWheels: numberOfWheels, transmission: transmission, motorPower: motorPower, fuel:.diesel)
    }

    override func controlCar(_ action: ActionCars) {
        switch action {
        case .startEngine:
            self.engineStateIs = true
        case .stopEngine:
            self.engineStateIs = false
        case .openWindows:
            self.windowsStateIs = true
        case .closeWindows:
            self.windowsStateIs = false
        case .activationSystemPlaton:
            self.systemPlaton = true
        case .deactivationSystemPlaton:
            self.systemPlaton = false
        default:
            break
        }
    }
}

let mustangCar = SportCar(brand: "Ford", yearOfIssue: 1967, numberOfDoors: 2, numberOfWheels: 4, transmission: .manual, motorPower: 355, fuel: .petrol92, deflector: false, carbonBody: false)
mustangCar.controlCar(.openWindows)
mustangCar.controlCar(.closeWindows)
mustangCar.controlCar(.startEngine)
mustangCar.controlCar(.activationSystemPlaton) // ?? Как сделать так чтобы ненужные в этом объекте enum  не вылазили в подсказках? Как например тут, на спорткарах система платон не устанавливается)))
mustangCar.controlCar(.startNitro)

print("________________________________________")

let MAN_TrunkCar = TrunkCar(brand: "MAN", yearOfIssue: 2013, numberOfDoors: 2, numberOfWheels: 6, transmission: .manual, motorPower: 456, typeTrunk: .tipper)
MAN_TrunkCar.controlCar(.closeWindows)
MAN_TrunkCar.controlCar(.startEngine)
MAN_TrunkCar.controlCar(.activationSystemPlaton)
