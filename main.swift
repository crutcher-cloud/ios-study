//
//  main.swift
//  lesson-6
//
//  Created by Влад Голосков on 15.07.2020.
//  Copyright © 2020 Владислав Голосков. All rights reserved.
//

import Foundation

import Foundation

//Task 1. Realize your type of collection "queue" using generics.
struct queue<T> {
    private var elements = [T]()
    
    mutating func enque(element: T) {
        if elements.count != 0 {
            elements.append(element)
            for index in (1...elements.count-1).reversed() {
                let buf = elements[index - 1]
                elements[index - 1] = elements[index]
                elements[index] = buf
            }
        } else {
            elements.append(element)
        }
    }
    
    mutating func deque() -> T? {
        return elements.removeLast()
    }
}

extension queue: CustomStringConvertible {
    var description: String {
        return "Elements in queue: \(elements)"
    }
}

//Task 2. Add a few higher-order methods to this collection.
extension queue {
    func filter(_ predicate: (T) -> Bool) -> [T] {
        var newArray = [T]()
        for item in elements {
            if predicate(item) {
                newArray.append(item)
            }
        }
        
        return newArray
    }
}


//Task 3. Add your own subscript, which will return nil if you access a non-existing index.
extension queue {
    subscript(index: Int) -> T? {
        get {
            if index > elements.count - 1 {
                return nil
            } else {
                return elements[index]
            }
        }
    }
}



var intNumbersQueue = queue<Int>()

intNumbersQueue.enque(element: 10)
intNumbersQueue.enque(element: 20)
intNumbersQueue.enque(element: 1)
intNumbersQueue.enque(element: 33)
intNumbersQueue.enque(element: 44)

var namesQueue = queue<String>()

namesQueue.enque(element: "Mark")
namesQueue.enque(element: "James")
namesQueue.enque(element: "Sergio")

print(intNumbersQueue)

print(namesQueue)

print(namesQueue.filter() {$0.count < 6})
    
print(intNumbersQueue.filter() { $0 % 2 != 0 })
print(intNumbersQueue.filter() { $0 % 2 == 0 })

print(intNumbersQueue[8] as Any)

