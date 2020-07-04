import UIKit

enum VehicleInteraction {
    case startEngine, stopEngine, openWindows, closeWindows
}

enum CargoInteraction {
    case addCargo(weight: Int)
    case reduceCargo(weight: Int)
}

struct lightVehicle {
    var brandName: String
    var year: Int

    var isEngineStart: Bool
    var isWindowsOpen: Bool
    
    var maxPassengerCount: UInt8
    var currentPassengerCount: UInt8
    
    var trunkCapacity: Int
    var filledSpace: Int
    var freeSpace: Int {
        get {
            return trunkCapacity - filledSpace
        }
    }
    
    func printPassangersInfo() {
        print("\(brandName):\nВсего пассажирских мест: \(maxPassengerCount)\nЗанято мест: \(currentPassengerCount)\nСвободно мест: \(maxPassengerCount - currentPassengerCount)\n")
    }
    
    func printSpaceInfo() {
        print("\(brandName):\nСвободно: \(freeSpace) кг.\nЗанято: \(filledSpace) кг.\n")
    }
    
    mutating func carInteraction(actionName action: VehicleInteraction) {
        switch action {
        case .startEngine:
            isEngineStart = true
            print("\(brandName): Двигатель запущен!")
        case .stopEngine:
            isEngineStart = false
            print("\(brandName): Двигатель остановлен!")
        case .openWindows:
            isWindowsOpen = true
            print("\(brandName): Окна открыты!")
        case .closeWindows:
            isWindowsOpen = false
            print("\(brandName): Окна закрыты!")
        }
    }
    
    mutating func cargoInteraction(actionName action: CargoInteraction) {
           switch action {
           case .addCargo(weight: let weight):
               if filledSpace + weight < trunkCapacity {
                   filledSpace += weight
                   print("\(brandName): \(weight) кг. груза добавлено!\n")
               } else {
                   print("\(brandName): Ошибка! Слишком большое количество груза! Свободно \(freeSpace) кг.\n")
               }
           case .reduceCargo(weight: let weight):
               if filledSpace - weight >= 0 {
                   filledSpace -= weight
                   print("\(brandName): \(weight) кг. груза убрано!\n")
               } else {
                   print("\(brandName): Такого количества груза в машине нет! Убран весь имеющийся груз.\n")
                   filledSpace = 0
               }
           }
       }
}

struct heavyVehicle {
    var brandName: String
    var year: Int

    var isEngineStart: Bool
    var isWindowsOpen: Bool
    
    var bodyCapacity: Int
    var filledSpace: Int
    var freeSpace: Int {
        get {
            return bodyCapacity - filledSpace
        }
    }
    
    func printSpaceInfo() {
        print("\(brandName):\nСвободно: \(freeSpace) кг.\nЗанято: \(filledSpace) кг.\n")
    }
    
    mutating func carInteraction(actionName action: VehicleInteraction) {
        switch action {
        case .startEngine:
            isEngineStart = true
            print("\(brandName): Двигатель запущен!")
        case .stopEngine:
            isEngineStart = false
            print("\(brandName): Двигатель остановлен!")
        case .openWindows:
            isWindowsOpen = true
            print("\(brandName): Окна открыты!")
        case .closeWindows:
            isWindowsOpen = false
            print("\(brandName): Окна закрыты!")
        }
    }
    
    mutating func cargoInteraction(actionName action: CargoInteraction) {
        switch action {
        case .addCargo(weight: let weight):
            if filledSpace + weight < bodyCapacity {
                filledSpace += weight
                print("\(brandName): \(weight) кг. груза добавлено!\n")
            } else {
                print("\(brandName): Ошибка! Слишком большое количество груза! Свободно \(freeSpace) кг.\n")
            }
        case .reduceCargo(weight: let weight):
            if filledSpace - weight >= 0 {
                filledSpace -= weight
                print("\(brandName): \(weight) кг. груза убрано!\n")
            } else {
                print("\(brandName): Такого количества груза в машине нет! Убран весь имеющийся груз.\n")
                filledSpace = 0
            }
        }
    }
}

var firstTruck = heavyVehicle(brandName: "Volvo", year: 2012, isEngineStart: false, isWindowsOpen: false, bodyCapacity: 4000, filledSpace: 700)
firstTruck.carInteraction(actionName: .startEngine)
firstTruck.carInteraction(actionName: .openWindows)

firstTruck.cargoInteraction(actionName: .addCargo(weight: 500))
firstTruck.printSpaceInfo()

var secondTruck = heavyVehicle(brandName: "Kamaz", year: 1989, isEngineStart: true, isWindowsOpen: true, bodyCapacity: 7000, filledSpace: 1000)
secondTruck.cargoInteraction(actionName: .reduceCargo(weight: 250))
secondTruck.printSpaceInfo()

secondTruck.carInteraction(actionName: .closeWindows)
secondTruck.carInteraction(actionName: .stopEngine)

var sportCar = lightVehicle(brandName: "BMW", year: 2019, isEngineStart: false, isWindowsOpen: false, maxPassengerCount: 2, currentPassengerCount: 1, trunkCapacity: 200, filledSpace: 5)
sportCar.carInteraction(actionName: .startEngine)
sportCar.carInteraction(actionName: .openWindows)
sportCar.printPassangersInfo()

sportCar.cargoInteraction(actionName: .addCargo(weight: 10))
sportCar.printSpaceInfo()
