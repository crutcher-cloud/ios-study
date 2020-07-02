//
//  main.swift
//  Lesson 2
//
//  Created by Влад Голосков on 02.07.2020.
//  Copyright © 2020 Владислав Голосков. All rights reserved.
//

import Foundation

func getValueFromCommandLine() -> Int {
    let inputValue = readLine()
    return (Int(inputValue!) ?? 0)
}

func isDivide(_ dividend: Int, _ divider: Int) -> Bool {
    if dividend % divider == 0 {
        return true
    } else {
        return false
    }
}

func createArray(startValue: Int, itemsCount: Int) -> Array<Int> {
    var array = [startValue]
    for index in 0..<itemsCount-1 {
        array.append(array[index] + 1)
    }
    return array
}

func addFibonachiNumber(_ userArray: Array<UInt>) -> Array<UInt> {
    var array = userArray
    let f1 = array[array.count-1]
    let f2 = array[array.count-2]
    array.append(f1+f2)
    
    return array
}

print("Проверка числа на кратность 2м и 3м. Введите число:")
let userInput = getValueFromCommandLine()

if isDivide(userInput, 2) {
    print("Число четное!")
} else {
    print("Число не четное!")
}

if isDivide(userInput, 3) {
    print("Число кратно 3!\n")
} else {
    print("Число не кратно 3!\n")
}

print("Введите начальное значение массива:")
let arrayStartValue = getValueFromCommandLine()

var array = createArray(startValue: arrayStartValue, itemsCount: 100)
print("Начальное значение массива: \(array)\n")

for item in array {
    if isDivide(item, 2) || isDivide(item, 3) {
        let removeIndex = array.firstIndex(of: item) ?? 0
        array.remove(at: removeIndex)
    }
}

print("Финальное значение массива: \(array)\n")

var fibonArray: [UInt] = [0,1]

print("Начальное значение массива с числами Фибоначчи: \(fibonArray)")

for _ in 0...89 {
    fibonArray = addFibonachiNumber(fibonArray)
}

fibonArray = addFibonachiNumber(fibonArray)

print("Финальное значение массива с числами Фибоначчи: \(fibonArray)")
