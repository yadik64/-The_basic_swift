import UIKit

// Функция определяет четное число или нет. Возвращает true если число четное.
func evenOrOdd(number: Int) -> Bool {
    return number % 2 == 0
}

// Функция определяет делится ли число на 3 без остатка. Возвращает true если делится на 3 без остатка.
func divisionByThree(number: Int) -> Bool {
    if number % 3 == 1 {
        return true
    } else {
        return false
    }
}

// Функция принимает массив произвольных чисел, а возвращает массив нечетных чисел которые делятся на три
func test(array: [Int]) -> [Int] {
    var resultArray: [Int] = []
    for i in array {
        if evenOrOdd(number: array[i - 1]) && divisionByThree(number: array[i - 1]) {
            resultArray.append(i - 1)
        }
    }
    return resultArray
}
var arrayNum = Array(1...100) // Инициализируем массив из целых чисел от 1 до 100
arrayNum = test(array: arrayNum)

// Функция добавляет в массив n чисел Фибоначчи

func feb(n: Int) -> [BInt] {
    var num: (BInt, BInt) = (1, 0)
    var febanachi: BInt!
    var arrayFeb = [BInt]()
    for i in 0..<n {
        if i == 0 {
            arrayFeb.append(1)
        } else {
            febanachi = num.0 + num.1
            num.1 = num.0
            num.0 = febanachi
            arrayFeb.append(febanachi)
        }
    }
    return arrayFeb
}

// Создаем массив и заполняем его сотней чисел Фибоначчи
var arrayF: [BInt] = feb(n: 100)

// Выводим на экран содержимое массива arrayF
for i  in 0...99 {
    print(arrayF[i])
}


// Функция определяет является ли число простым. Если число простое возвращает true, в обратном случии false
func prime (num: Int) -> Bool {
    if num < 2 {
        return false
    }
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    return true
}

// Функция возвращает массив состоящий из n-ного количества простых чисел
func primeArray(n: Int) -> [Int] {
    var array = [Int]()
    var counter = 2
    while array.count < n {
        if prime(num: counter) {
            array.append(counter)
        }
        counter += 1
    }
    return array
}

//Создаем массив и наполняем его сотней простых чисел
let arrayPrimeNum = primeArray(n: 100)

