import UIKit
import Foundation

enum generalActions {
    case engineStart
    case engineStop
    case windowsOpen
    case windowsClose
    
    case sportAction(sportActions)
    case trunkAction(trunkActions)
}

enum sportActions {
    case increaseClearance(value: Int)
    case decreaseClearance(value: Int)
    case changeColor(newColor: UIColor)
}

enum trunkActions {
    case addCargo(value: Int)
    case removeCargo(value: Int)
}

class Car {
    var brandName: String
    var VIN: String
    var doorsCount: Int

    var isEngineStart: Bool
    var isWindowsOpen: Bool

    func doAction(action: generalActions) {
        
    }

    init(brandName: String, VIN: String, doorsCount: Int, isEngineStart: Bool, isWindowsOpen: Bool) {
        self.brandName = brandName
        self.VIN = VIN
        self.doorsCount = doorsCount
        self.isEngineStart = isEngineStart
        self.isWindowsOpen = isWindowsOpen
    }
}

class SportCar: Car {
    var color: UIColor
    var enginePower: Int
    var clearance: Int
    var isTurbine: Bool
    
    override func doAction(action: generalActions) {
        switch action {
        case .engineStart:
            isEngineStart = true
            print("\(brandName): двигатель запущен!")
        case .engineStop:
            isEngineStart = false
            print("\(brandName): двигатель остановлен!")
        case .windowsOpen:
            isWindowsOpen = true
            print("\(brandName): окна открыты!")
        case .windowsClose:
            isWindowsOpen = false
            print("\(brandName): окна закрыты!")
        case .sportAction(.changeColor(newColor: let newColor)):
            color = newColor
        case .sportAction(.decreaseClearance(value: let value)):
            clearance -= value
        case .sportAction(.increaseClearance(value: let value)):
            clearance += value
        case .trunkAction(.addCargo):
            print("Действие доступно только для грузовых машин!")
        case .trunkAction(.removeCargo):
            print("Действие доступно только для грузовых машин!")
        }
    }

    init(brandName: String, color: UIColor, VIN: String, doorsCount: Int, isEngineStart: Bool, isWindowsOpen: Bool, enginePower: Int, clearance: Int, isTurbine: Bool) {
        self.enginePower = enginePower
        self.color = color
        self.clearance = clearance
        self.isTurbine = isTurbine
        
        super.init(brandName: brandName, VIN: VIN, doorsCount: doorsCount, isEngineStart: isEngineStart, isWindowsOpen: isWindowsOpen)
    }
}

class TrunkCar: Car {
    var bodyCapacity: Int
    var currentCargo: Int
    var freeCargo: Int {
        get {
            bodyCapacity - currentCargo
        }
    }
    
    override func doAction(action: generalActions) {
        switch action {
        case .engineStart:
            isEngineStart = true
            print("\(brandName): двигатель запущен!")
        case .engineStop:
            isEngineStart = false
            print("\(brandName): двигатель остановлен!")
        case .windowsOpen:
            isWindowsOpen = true
            print("\(brandName): окна открыты!")
        case .windowsClose:
            isWindowsOpen = false
            print("\(brandName): окна закрыты!")
        case .sportAction(.changeColor(newColor: _)):
            print("Действие доступно только для спортивных машин!")
        case .sportAction(.decreaseClearance(value: _)):
            print("Действие доступно только для спортивных машин!")
        case .sportAction(.increaseClearance(value: _)):
            print("Действие доступно только для спортивных машин!")
        case .trunkAction(.addCargo(value: let newCargo)):
            if currentCargo + newCargo <= freeCargo {
                currentCargo += newCargo
                print("Добавлено \(newCargo)кг. груза")
            } else {
                print("Слишком много груза! Свободного места: \(freeCargo)")
            }
        case .trunkAction(.removeCargo(value: let newCargo)):
            if currentCargo - newCargo >= 0 {
                currentCargo -= newCargo
                print("Убрано \(newCargo)кг. груза")
            } else {
                print("Столько груза нет в машине! Текущее количество груза: \(currentCargo)")
            }
        }
    }
    
    init(brandName: String, VIN: String, doorsCount: Int, isEngineStart: Bool, isWindowsOpen: Bool, bodyCapacity: Int, currentCargo: Int) {
        self.bodyCapacity = bodyCapacity
        self.currentCargo = currentCargo
        
        super .init(brandName: brandName, VIN: VIN, doorsCount: doorsCount, isEngineStart: isEngineStart, isWindowsOpen: isWindowsOpen)
    }
}

var testSportCar = SportCar(brandName: "Ferrari", color: .black, VIN: "tc123", doorsCount: 2, isEngineStart: false, isWindowsOpen: false, enginePower: 160, clearance: 100, isTurbine: true)

testSportCar.doAction(action: .sportAction(.changeColor(newColor: .red)))

print("Текущий клиренс: \(testSportCar.clearance)")
testSportCar.doAction(action: .sportAction(.increaseClearance(value: 10)))
print("Текущий клиренс: \(testSportCar.clearance)")

testSportCar.doAction(action: .engineStart)

var testTrunkCar = TrunkCar(brandName: "Volvo", VIN: "123trunk", doorsCount: 4, isEngineStart: false, isWindowsOpen: false, bodyCapacity: 4000, currentCargo: 350)

testTrunkCar.doAction(action: .engineStart)
testTrunkCar.doAction(action: .windowsOpen)

testTrunkCar.doAction(action: .trunkAction(.addCargo(value: 600)))
testTrunkCar.doAction(action: .sportAction(.changeColor(newColor: .black)))

testTrunkCar.doAction(action: .trunkAction(.removeCargo(value: 3000)))
testTrunkCar.doAction(action: .trunkAction(.removeCargo(value: 950)))
