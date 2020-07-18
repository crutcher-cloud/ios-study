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
    func getEmployeeInfo(employeeName name: String) -> (Employee?, companyErrors?) {
        guard let currentEmployee = employeeList[name] else {
            return (nil, .undefinedEmployee)
        }
        return (currentEmployee, nil)
    }
    
    func getEmployeeWithMaxSalary() -> (Employee?, companyErrors?) {
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
