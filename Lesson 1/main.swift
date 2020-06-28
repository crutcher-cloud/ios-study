//
//  main.swift
//  Lesson 1
//
//  Created by Влад Голосков on 27.06.2020.
//  Copyright © 2020 Владислав Голосков. All rights reserved.
//

import Foundation

//Функция для ввода значений с клавиатуры
func input() -> Double {
    let inputValue = readLine()
    return (Double(inputValue!) ?? 0)
}

func quadraticEquation() {
    print("Общий вид уравнения: ax^2 + bx + c = 0;")
    
    print("Введите значение коэффицента a:")
    let a = input()

    print("Введите значение коэффицента b:")
    let b = input()

    print("Введите значение коэффицента c:")
    let c = input()

    let discriminant: Double = pow(Double(b), 2) - Double(4 * a * c)

    if (discriminant < 0) {
        print("Действительных корней нет!\n")
    } else if (discriminant == 0) {
        let x = (-b / (2 * a))
        print("Корень уравнения: x = \(Int(x));\n")
    } else {
        let x1 = (-b + sqrt(discriminant)) / (2 * a)
        let x2 = (-b - sqrt(discriminant)) / (2 * a)
        
        print("Корни уравнения: x1 = \(Int(x1)); x2 = \(Int(x2));\n")
    }
}

func triangle() {
    print("Введите значение первого катета:")
    let cathetusOne = input()
    
    print("Введите значение второго катета:")
    let cathetusTwo = input()
    
    print("Катеты равны: \(cathetusOne)см. и \(cathetusTwo)см.\n-------------------------")

    if (cathetusOne < 1) || (cathetusTwo < 1) {
        print("Ошибка! Введены некорректные значения.")
    } else {
        var hypotenuse = sqrt(pow(Double(cathetusOne), 2) + pow(Double(cathetusTwo), 2))
        hypotenuse = round(hypotenuse * 100) / 100
        
        let perimeter = Double(cathetusOne + cathetusTwo) + hypotenuse
        
        let square = (cathetusOne * cathetusTwo) / 2
        
        print("Гипотенуза равна \(hypotenuse)см.")
        print("Периметр равен \(perimeter)см.")
        print("Площадь равна \(square)см^2.")
    }
}

func bankCalc() {
    print("Введите сумму вклада:")
    var sum = input()
    
    print("Введите годовой процент:")
    let percent = input()

   for i in 0...4 {
        sum = sum + (sum * (percent / 100))
        print("Сумма вклада на \(i+1) год: \(round(sum * 100) / 100)")
    }
}

print("Для того чтобы открыть Задание 1 введите \(1)\nДля того чтобы открыть Задание 2 введите \(2)\nДля того чтобы открыть Задание 3 введите \(3)")
let menu = input()

switch menu {
case 1.0:
    quadraticEquation()
case 2.0:
    triangle()
case 3.0:
    bankCalc()
default:
    print("Такого пункта в меню нет!")
}
