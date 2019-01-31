import UIKit

struct User {
    let login: String
    var password: String
}


enum RegistrationError: Error {
    case loginBusy
    case incorrectPassword
}

class UserRegistration {
    private var users = [User]()
    let minMaxSymPass = (min: 6, max: 8)
    
    func registration(login: String, pass: String) throws -> User {
        for user in users {
            guard user.login != login else {
                throw RegistrationError.loginBusy
            }
        }
        guard pass.count != 0 && pass.count < minMaxSymPass.max && pass.count >= minMaxSymPass.min else {
            throw RegistrationError.incorrectPassword
        }
        
        users.append(User(login: login, password: pass))
        return users[users.count - 1]
    }
}


let reg = UserRegistration()

try? reg.registration(login: "BadDay", pass: "123456")

do {
    let user = try reg.registration(login: "Jon", pass: "123456")
    print("Регистрация прошла успешно\nВаш логин: \(user.login)\nВаш пароль: \(user.password)")
} catch RegistrationError.loginBusy {
    print("Логин занят!")
} catch RegistrationError.incorrectPassword {
    print("Некорректный пароль")
}

print("---------------------------------")

do {
    let user = try reg.registration(login: "Jon", pass: "1234dss")
    print("Регистрация прошла успешно\nВаш логин: \(user.login)\nВаш пароль: \(user.password)")
} catch RegistrationError.loginBusy {
    print("Логин занят!")
} catch RegistrationError.incorrectPassword {
    print("Некорректный пароль")
}

print("---------------------------------")

do {
    let user = try reg.registration(login: "Boby", pass: "1234")
    print("Регистрация прошла успешно\nВаш логин: \(user.login)\nВаш пароль: \(user.password)")
} catch RegistrationError.loginBusy {
    print("Логин занят!")
} catch RegistrationError.incorrectPassword {
    print("Некорректный пароль!")
}
