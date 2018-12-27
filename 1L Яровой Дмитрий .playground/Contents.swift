import UIKit

// Зачислили на курс за 3 часа до сдачи первого домашнего задания. Урок не смотрел, чтобы успеть сделать ДЗ. 

// Решение квадратного уравнения Задание 1

func discr(a: Double, b: Double, c: Double) -> Double {
    let descriminant = pow(b, 2) - 4 * a * c
    return descriminant
}

var str: String? = nil
var xTuples: (Double?, Double?) = (nil, nil)
let a: Double = 2
let b: Double = 5
let c: Double = -3

 print("Решение квадратного уравнения:")

if a != 0 {
    let d = discr(a: a, b: b, c: c)
    print("Дискриминант = \(d)")
            
    switch d {
    case _ where d < 0:
        print("Так как дискриминант меньше нуля. Уравнение не имеет решения в действительных числах")
    case 0:
        xTuples.0 = -b / 2 * a
        if xTuples.0 == -0 {xTuples.0 = 0}
        print("Уравнение имеет один корень. Х = \(xTuples.0!)")
    case _ where d > 0:
        xTuples.0 = (-b + sqrt(d)) / (2 * a)
        xTuples.1 = (-b - sqrt(d)) / (2 * a)
        if xTuples.0 == -0 {
            xTuples.0 = 0
        } else if xTuples.1 == -0 {
            xTuples.1 = 0
        }
        print("Уравнение имеет два корня. X1 = \(xTuples.0!) и X2 = \(xTuples.1!)")
    default:
        break
            }
} else if a == 0 {
    print("При 'a' равном нулю, уравнение приведено к виду bx + c = 0")
    xTuples.0 = -c / b
    print("X = \(xTuples.0!)")
}

// Прямоугольный треугольник Задание 2

let legTriangle: (Double, Double) = (3, 4)
let areaTriangle = 0.5 * legTriangle.0 * legTriangle.1;
let hypotenuseTriangle = sqrt(pow(legTriangle.0, 2) + pow(legTriangle.1, 2))
let perimeterTriangle = legTriangle.0 + legTriangle.1 + hypotenuseTriangle

print("\nПлощадь прямоугольного треугольника = \(areaTriangle)\nГипотенуза = \(hypotenuseTriangle)\nПериметр = \(perimeterTriangle)")

// Калькулятор депозита Задание 3

let sumDeposit: Double = 50000
let percent: Double = 10.5
let age = 5
let amountDeposit = sumDeposit * percent * Double(age) / 100 + sumDeposit
print("\nДоход от вклада за 5 лет при ставке \(percent)% составляет \(amountDeposit - sumDeposit) рублей\nОбщая сумма вклада \(amountDeposit) рублей")

