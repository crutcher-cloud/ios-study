import UIKit

protocol Car {
    var brandName: String { get }
    var VIN: String { get }
    var color: String { get set }
    
    var isEngineStart: Bool { get set }
    var isWindowsOpen: Bool { get set }
    
    func doAction()
}

extension Car {
    mutating func startEngine() {
        if !isEngineStart {
            print("\(brandName): двигатель запущен!\n")
            isEngineStart = true
        } else { print("Двигатель уже запущен!\n") }
    }
    
    mutating func stopEngine() {
        if isEngineStart {
            print("\(brandName): двигатель остановлен!\n")
            isEngineStart = false
        } else { print("Двигатель уже остановлен!\n") }
    }
    
    mutating func openWindows() {
        if !isWindowsOpen {
            print("\(brandName): окна открыты!\n")
            isWindowsOpen = true
        } else { print("Окна уже открыты!\n") }
    }
    
    mutating func closeWindows() {
        if isWindowsOpen {
            print("\(brandName): окна закрыты!\n")
            isWindowsOpen = true
        } else { print("Окна уже закрыты!\n") }
    }
}

class SportCar: Car {
    var brandName: String
    var VIN: String
    var color: String
    var isEngineStart: Bool
    var isWindowsOpen: Bool
    
    var clearance: Int
    var isSpoilerActive: Bool
    
    func increaseClearance(value: Int) {
        clearance += value
        print("Клиренс увеличен на \(value). Текущее значение: \(clearance)\n")
    }
    
    func decreaseClearance(value: Int) {
        clearance -= value
        print("Клиренс уменьшен на \(value). Текущее значение: \(clearance)\n")
    }
    
    init(brandName: String, VIN: String, color: String, isEngineStart: Bool, isWindowsOpen: Bool, isSpoilerActive: Bool, clearance: Int) {
        self.brandName = brandName
        self.VIN = VIN
        self.color = color
        self.clearance = clearance
        
        self.isEngineStart = isEngineStart
        self.isWindowsOpen = isWindowsOpen
        self.isSpoilerActive = isSpoilerActive
    }
}

extension SportCar {
    func doAction() {
        switch isSpoilerActive {
        case true:
            print("Спойлер опущен!\n")
            isSpoilerActive = false
        case false:
            print("Спойлер поднят!\n")
            isSpoilerActive = true
        }
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return """
        Это спортивная машина.
        Марка: \(brandName)
        Цвет: \(color)
        Идентификационный номер: \(VIN)
        Клиренс: \(clearance)\n
        """
    }
}

class TrunkCar: Car {
    var brandName: String
    var VIN: String
    var color: String
    var isEngineStart: Bool
    var isWindowsOpen: Bool
    
    var bodyCapacity: Int
    var currentCargo: Int
    var freeSpace: Int {
        get {
            return bodyCapacity - currentCargo
        }
    }
    
    func addCargo(newCargo: Int) {
        if currentCargo + newCargo <= freeSpace {
            currentCargo += newCargo
            print("Добавлено \(newCargo)кг. груза\n")
        } else {
            print("Слишком много груза! Свободного места: \(freeSpace)\n")
        }
    }
    
    func removeCargo(newCargo: Int) {
        if currentCargo - newCargo >= 0 {
            currentCargo -= newCargo
            print("Убрано \(newCargo)кг. груза\n")
        } else {
            print("Столько груза нет в машине! Текущее количество груза: \(currentCargo)\n")
        }
    }
    
    init(brandName: String, VIN: String, color: String, isEngineStart: Bool, isWindowsOpen: Bool, bodyCapacity: Int, currentCargo: Int) {
        self.brandName = brandName
        self.VIN = VIN
        self.color = color
        self.isEngineStart = isEngineStart
        self.isWindowsOpen = isWindowsOpen
        
        self.bodyCapacity = bodyCapacity
        self.currentCargo = currentCargo
    }
}

extension TrunkCar {
    func doAction() {
        print("B-E-E-E-P!\n")
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return """
        Это грузовая машина.
        Марка: \(brandName)
        Цвет: \(color)
        Идентификационный номер: \(VIN)
        Вместимость кузова: \(bodyCapacity) кг.
        Количество груза в машине: \(currentCargo) кг.
        Свободное место: \(freeSpace) кг.\n
        """
    }
}

var ferrari = SportCar(brandName: "Ferrari", VIN: "127RU691FF", color: "Red", isEngineStart: false, isWindowsOpen: false, isSpoilerActive: false, clearance: 100)

ferrari.doAction()
ferrari.doAction()

ferrari.startEngine()
ferrari.openWindows()

ferrari.increaseClearance(value: 10)

print(ferrari)

var kamaz = TrunkCar(brandName: "Kamaz", VIN: "453UA123KK", color: "Orange", isEngineStart: false, isWindowsOpen: true, bodyCapacity: 4000, currentCargo: 200)

kamaz.startEngine()
kamaz.closeWindows()

kamaz.addCargo(newCargo: 100)
kamaz.removeCargo(newCargo: 10)

kamaz.doAction()

print(kamaz)
