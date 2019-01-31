import UIKit

protocol Gradetable {
    var fullName: String { get set}
    var grades: [Int] { get set }
    
    func averageGrade() -> Double
}

extension Gradetable {
    func averageGrade() -> Double {
        var result = 0.0
        if grades.isEmpty {
            return result
        } else {
            var allGrades = 0
            for grade in grades {
                allGrades += grade
            }
            result = Double(allGrades) / Double(grades.count)
            return round(result * 100 ) / 100
        }
    }
}

struct Students: Gradetable {
    var name: String
    var surName: String?
    var fullName: String {
        get {
            return name + " " + surName!
        }
        set {
            var fullname: [String] = []
            fullname = newValue.components(separatedBy: " ")
            self.name = fullname[0]
            
            if fullname.count >= 2 {         // Как лучше, создать константу хранящую значение 2 (Это нужное нам количество элементов массива Имя и Фамилия) или
                self.surName = fullname[1]   // или же оставить 2. Вопрос касаемо магических чисел в коде. Я просто слышал что лучше создавать константу под
            } else {                         // каждое такое число
                self.surName = nil
            }
        }
    }
    var grades: [Int]
}

struct Queue<T: Gradetable> {
    private var elements: [T] = []
    
    var count: Int {
        return self.elements.count
    }
    
    var isEmpty: Bool {
        return elements.count == 0
    }
    
    mutating func enqueue(_ element: T) {
        self.elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard !self.elements.isEmpty else {
            return nil
        }
        return self.elements.removeFirst()
    }
    
    func peek() -> T {
        return self.elements[0]
    }
    
    subscript(element: Int) -> T? {
        if self.elements.count - 1 < element {
            return nil
        } else {
            return self.elements[element]
        }
    }
    
}

extension Queue {
    func avereageGradesJournal() -> [(String, Double)] {
        var avereageGrades = [(String, Double)]()
        for index in 0...elements.count - 1 {
            avereageGrades.append((elements[index].fullName, elements[index].averageGrade()))
        }
        return avereageGrades
    }
    
    func sortedByProgress(by closure: (Double, Double) -> Bool) -> [(String, Double)] {
        var avereageGrades = avereageGradesJournal()
        var boof = ("", 0.0)
        for _ in avereageGrades {
            for index in 0...avereageGrades.count - 1 {
                if index + 1 <= avereageGrades.count - 1 {
                    if closure(avereageGrades[index].1, avereageGrades[index + 1].1) {
                        boof = avereageGrades[index]
                        avereageGrades[index] = avereageGrades[index + 1]
                        avereageGrades[index + 1] = boof
                    }
                }
            }

        }
        return avereageGrades
    }
}


var queueStudent = Queue<Students>()
queueStudent.enqueue(Students(name: "Joey", surName: "Ramone", grades: [3,5,4,5]))
queueStudent.enqueue(Students(name: "Brian", surName: "Johnson", grades: []))
queueStudent.enqueue(Students(name: "James", surName: "Hetfield", grades: [4,5,5,5,3,4]))
queueStudent.enqueue(Students(name: "Ozzy", surName: "Osbourne", grades: [2,2,4,3,3,4]))
queueStudent.count
queueStudent[4]
queueStudent.avereageGradesJournal()
queueStudent.sortedByProgress(by: <)
queueStudent.sortedByProgress(by: >)
queueStudent.isEmpty
queueStudent.peek()
queueStudent.dequeue()
queueStudent.count
