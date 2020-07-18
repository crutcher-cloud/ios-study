//
//  main.swift
//  lesson-7
//
//  Created by Влад Голосков on 18.07.2020.
//  Copyright © 2020 Владислав Голосков. All rights reserved.
//

import Foundation

//Task 1. Come up with a class whose methods may fail and return either a value or an Error?Implement their call and process the result of the method using the if let or guard let construct.

struct Employee {
    let name: String
    var experience: UInt
    var salary: UInt
}

enum companyErrors: Error {
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
