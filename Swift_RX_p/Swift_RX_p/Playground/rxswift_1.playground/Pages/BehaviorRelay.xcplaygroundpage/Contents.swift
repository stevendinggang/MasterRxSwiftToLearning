//: [Previous](@previous)

import Foundation
import RxSwift
import RxCocoa

var greeting = "Hello, playground"

let disposeBag = DisposeBag()

let relay = BehaviorRelay(value: ["items 2"])

var value = relay.value

value.append("item 2")
value.append("item 3")

relay.accept(relay.value + ["item 1"])
relay.asObservable().subscribe{
    print($0)
}

//relay.accept("hello")


