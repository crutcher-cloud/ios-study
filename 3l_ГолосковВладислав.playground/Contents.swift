import UIKit

enum VehicleInteraction {
    case startEngine, stopEngine, openWindows, closeWindows
}

enum CargoInteraction {
    case addCargo, reduceCargo
}

struct heavyVehicle {
    var brandName: String
    var year: Int

    var isEngineStart: Bool
    var isWindowsOpen: Bool
    
    var bodySpace: Int
    var filledSpace: Int
    var freeSpace: Int {
        get {
            return bodySpace - filledSpace
        }
    }
    
    func printSpace() {
        print("Свободно: \(freeSpace) кг.\nЗанято: \(filledSpace) кг.\n")
    }
    
    mutating func carInteraction(actionName action: VehicleInteraction) {
        switch action {
        case .startEngine:
            isEngineStart = true
            print("Двигатель запущен!")
        case .stopEngine:
            isEngineStart = false
            print("Двигатель остановлен!")
        case .openWindows:
            isWindowsOpen = true
            print("Окна открыты!")
        case .closeWindows:
            isWindowsOpen = false
            print("Окна закрыты!")
        }
    }
    
    mutating func cargoInteraction(actionName action: CargoInteraction, cargoAmount: Int) {
        switch action {
        case .addCargo:
            if filledSpace + cargoAmount < bodySpace {
                filledSpace += cargoAmount
                print("\(cargoAmount) кг. груза добавлено!\n")
            } else {
                print("Ошибка! Слишком большое количество груза! Свободно \(freeSpace) кг.\n")
            }
        case .reduceCargo:
            if filledSpace - cargoAmount >= 0 {
                filledSpace -= cargoAmount
                print("\(cargoAmount) кг. груза убрано!\n")
            } else {
                print("Такого количества груза в машине нет! Убран весь имеющийся груз.\n")
                filledSpace = 0
            }
        }
    }
}
