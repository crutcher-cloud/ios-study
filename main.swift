//
//  main.swift
//  lesson-7
//
//  Created by Влад Голосков on 18.07.2020.
//  Copyright © 2020 Владислав Голосков. All rights reserved.
//

import Foundation

//Task 1. Come up with a class whose methods may fail and return either a value or an Error? Implement their call and process the result of the method using the if let or guard let construct.

struct Employee {
    let name: String
    var experience: UInt
    var salary: UInt
}

enum CompanyErrors: Error {
    case undefinedEmployee
    case employeeListIsEmpty
}

class Company {
    var employeeList = [String: Employee]()
    
    func addEmployee(fullName FIO: String, experience exp: UInt, salary slr: UInt) {
        employeeList[FIO] = Employee(name: FIO, experience: exp, salary: slr)
    }
    
    func removeEmployee(fullName FIO: String) {
        employeeList.removeValue(forKey: FIO)
    }
}

var myCompany = Company()

//myCompany.addEmployee(fullName: "Фёдоров Александр Иванович", experience: 2, salary: 25000)

var employeeWithMaxSalary = myCompany.getEmployeeWithMaxSalary()
if let employee = employeeWithMaxSalary.0 {
    print("\(employee)\n")
} else if let error = employeeWithMaxSalary.1 {
    print("Произошла ошибка: \(error)\n")
}

myCompany.addEmployee(fullName: "Голосков Владислав Алексеевич", experience: 2, salary: 35000)
myCompany.addEmployee(fullName: "Иванов Сергей Петрович", experience: 5, salary: 40000)
myCompany.addEmployee(fullName: "Дарова Екатерина Сергеевна", experience: 4, salary: 30000)

var someEmployee = myCompany.getEmployeeInfo(employeeName: "Голосков Владислав Алексеевич")
if let employee = someEmployee.0 {
    print("\(employee)\n")
} else if let error = someEmployee.1 {
    print("Произошла ошибка: \(error)\n")
}

//Task 2. Create a class whose methods can throw out errors. Implement several throws-functions. Call them and process the result using the try/catch construct.

struct Item {
    var count: UInt
    var price: UInt
    let product: Product
}

struct Product {
    let name: String
}

enum StoreErrors: Error {
    case undefinedItem
    case overAdd
    case insufficientFunds (moneyNeeded: UInt)
}

class Store {
    var priceList = [String: Item]()
    
    func addItem(title: String, count: UInt, price: UInt) throws {
        guard priceList[title] == nil else {
            throw StoreErrors.overAdd
        }
        priceList[title] = Item(count: count, price: price, product: Product(name: title))
    }
    
    func removeItem(title: String) throws {
        guard priceList[title] != nil else {
            throw StoreErrors.undefinedItem
        }
        priceList.removeValue(forKey: title)
    }
    
    func sellItem(itemName: String, customerMoney: UInt) throws -> Product {
        guard let item = priceList[itemName] else {
            throw StoreErrors.undefinedItem
        }
        
        guard customerMoney >= item.price else {
            throw StoreErrors.insufficientFunds(moneyNeeded: item.price - customerMoney)
        }
        
        var soldItem = item
        soldItem.count -= 1
        priceList[itemName] = soldItem
        
        return soldItem.product
    }
}

var smartphoneStore = Store()

addItemInTo(smartphoneStore, itemName: "iPhone SE(2016)", count: 15, price: 12000)
addItemInTo(smartphoneStore, itemName: "iPhone 11 Pro", count: 10, price: 85000)
addItemInTo(smartphoneStore, itemName: "iPhone 11", count: 10, price: 60000)

removeItemFrom(smartphoneStore, itemName: "iPhone 16")

sellItemFrom(smartphoneStore, itemName: "iPhone 11 Pro", customerMoney: 90000)
sellItemFrom(smartphoneStore, itemName: "iPhone 16", customerMoney: 1000000)
