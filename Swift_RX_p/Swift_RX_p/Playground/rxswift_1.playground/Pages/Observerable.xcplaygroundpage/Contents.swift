//: [Previous](@previous)

import Foundation
import RxSwift
import RxCocoa


var greeting = "Hello, playground"

//: [Next](@next)

let observable = Observable.just(1)
let observable1 = Observable.of(1,2,3)
let observable3 = Observable.of([1,2,3])
let observable4 = Observable.from([1,23,4,5,6])

let  subscription4 = Observable.from([1,2,3,4,5,6])

observable4.subscribe { event in
    if let element = event.element {
        print(event)
    }
}

observable3.subscribe { event in
    print(event)
}

observable4.subscribe(onNext: { element in
    print(element)
})



