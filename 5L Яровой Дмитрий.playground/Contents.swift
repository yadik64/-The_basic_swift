import UIKit

// В протокол не стал добавлять общий метод. Совсем не увидел в этом смысла. Общие методы у нас же добавленны в расширение этого протокола. А индивидуальные методы я добавил в соответствующие классы.

protocol Car {
    var brand: String { get }
    var yearOfIssue: Int { get }
    var numberOfDoors: Int { get }
    var numberOfWheels: Int { get }
    var transmission: Transmission { get }
    var motorPower: Int { get }
    var engineStateIs: Bool { get set }
    var windowsStateIs: Bool { get set }
}

extension Car {
    mutating func startEngine() {
        if !engineStateIs {
            engineStateIs = true
        }
    }
    
    mutating func stopEngine() {
        if engineStateIs {
            engineStateIs = false
        }
    }
    
    mutating func openWindows() {
        if !windowsStateIs {
            windowsStateIs = true
        }
    }
    
    mutating func closeWindows() {
        if windowsStateIs {
            windowsStateIs = false
        }
    }
}

protocol ConsolePrintable: CustomStringConvertible { // Совсем не понял для чего нам нужен этот протокол.
    func printBrand()
}

extension ConsolePrintable {
    func printBrand() {
        print(description)
    }
}

enum Transmission {
    case manual
    case auto
}

class AnyCar: Car, ConsolePrintable {
    
    struct Parameters {
        var brand: String
        var yearOfIssue: Int
        var numberOfDoors: Int
        var numberOfWheels: Int
        var transmission: Transmission
        var motorPower: Int
    }
    
    let brand: String
    let yearOfIssue: Int
    let numberOfDoors: Int
    let numberOfWheels: Int
    let transmission: Transmission
    var motorPower: Int
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
    var description: String {
        return String(describing: brand)
    }
    
    //Вот так записывать нормально или нет? Я имею ввиду выстраивать в столбики с таким количеством пробелов??
    init(parameters: Parameters) {
        self.brand =          parameters.brand
        self.yearOfIssue =    parameters.yearOfIssue
        self.numberOfDoors =  parameters.numberOfDoors
        self.numberOfWheels = parameters.numberOfWheels
        self.transmission =   parameters.transmission
        self.motorPower =     parameters.motorPower
    }
}

class SportCar: AnyCar {
    var nitroStateIs: Bool = false {
        didSet {
            nitroStateIs ? print("Активированна закись азота") : print("Деактивированна закись азота")
        }
    }
    
    func startNitro() {
        if !nitroStateIs {
            nitroStateIs = true
        }
    }
    
    func stopNitro() {
        if nitroStateIs {
            nitroStateIs = false
        }
    }
}

class TrunkCar: AnyCar {
    var systemPlatonStateIs: Bool = false {
        didSet {
            systemPlatonStateIs ? print("Активированна система \"Платон\"") : print("Деактивированна система \"Платон\"")
        }
    }
    
    func startPlaton() {
        if !systemPlatonStateIs {
            systemPlatonStateIs = true
        }
    }
    
    func stopPlaton() {
        if systemPlatonStateIs {
            systemPlatonStateIs = false
        }
    }
}

var bmwSportCar = SportCar(parameters: .init(brand: "BMW", yearOfIssue: 2009, numberOfDoors: 2, numberOfWheels: 4, transmission: .manual, motorPower: 332))

bmwSportCar.startEngine()
bmwSportCar.openWindows()
bmwSportCar.startNitro()
bmwSportCar.printBrand()

print("-----------------------------------")

var scaniaTrunkCar = TrunkCar(parameters: .init(brand: "Scania", yearOfIssue: 2017, numberOfDoors: 2, numberOfWheels: 6, transmission: .auto, motorPower: 567))

scaniaTrunkCar.startPlaton()
scaniaTrunkCar.startEngine()
scaniaTrunkCar.stopPlaton()
scaniaTrunkCar.openWindows()
scaniaTrunkCar.printBrand()

// Не уверен в правильности своей реализации. Хотелось бы увидеть пример, так сказать, грамотного построения данной "конструкции". Это я про все задание вцелом. Я так понимаю даже это маленькое задание можно сделать основываясь на некоторые принципы SOLID, но имея нулевой опыт сложно понять получилось ли это или нет))) Так же возможно на лекции вы освятите такое понятие как "Абстракция" оно довольно часто встречается в изучаемой мной литературе, но человеческого объяснения, для дурачков) я так и не нашел, может у вас получится объяснить это "на пальцах". Уж больно хочется понять что же есть эта абстракция))
