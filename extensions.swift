//
//  extensions.swift
//  lesson-7
//
//  Created by Влад Голосков on 18.07.2020.
//  Copyright © 2020 Владислав Голосков. All rights reserved.
//

import Foundation

//Extensions for Task 1.

extension Employee: CustomStringConvertible {
    var description: String {
        return "ФИО: \(name)\nСтаж работы: \(experience)\nЗарплата: \(salary)"
    }
}

extension Company {
    func getEmployeeInfo(employeeName name: String) -> (Employee?, CompanyErrors?) {
        guard let currentEmployee = employeeList[name] else {
            return (nil, .undefinedEmployee)
        }
        return (currentEmployee, nil)
    }
    
    func getEmployeeWithMaxSalary() -> (Employee?, CompanyErrors?) {
        guard employeeList.count != 0 else {
            return (nil, .employeeListIsEmpty)
        }
        
        var maxSalary: UInt = 0
        var searchedEmployee = ""
        for item in employeeList {
            if item.value.salary > maxSalary {
                maxSalary = item.value.salary
                searchedEmployee = item.key
            }
        }
        
        return (employeeList[searchedEmployee], nil)
    }
}

//Extensions for Task 2.

extension Item: CustomStringConvertible {
    var description: String {
        return "Наименование: \(product.name)\nКоличество: \(count)\nСтоимость: \(price)\n"
    }
}

extension Product: CustomStringConvertible {
    var description: String {
        return "\(name)"
    }
}

func addItemInTo(_ store: Store, itemName: String, count: UInt, price: UInt) {
    do {
        try store.addItem(title: itemName, count: count, price: price)
        print("\(itemName) внесен в список товаров!\n")
    } catch StoreErrors.overAdd {
        print("\(itemName) уже есть в списке товаров!\n")
    } catch let error {
        print(error.localizedDescription)
    }
}

func removeItemFrom(_ store: Store, itemName: String) {
    do {
        try store.removeItem(title: itemName)
        print("\(itemName) удален из списка товаров!\n")
    } catch StoreErrors.undefinedItem {
        print("\(itemName) отсутствует в списке товаров!\n")
    } catch let error {
        print(error.localizedDescription)
    }
}

func sellItemFrom(_ store: Store, itemName: String, customerMoney: UInt) {
    do {
        let product = try store.sellItem(itemName: itemName, customerMoney: customerMoney)
        print("\(product) успешно приобретен!\nПоздравляем с покупкой!\n")
    } catch StoreErrors.undefinedItem {
        print("Такого товара в магазине нет :(\n")
    } catch StoreErrors.insufficientFunds(moneyNeeded: let moneyNeeded) {
        print("Недостаточно средств. Необходимо еще \(moneyNeeded)")
    } catch let error {
        print(error.localizedDescription)
    }
}
