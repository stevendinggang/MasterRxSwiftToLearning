//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import RxSwift

var greeting = "Hello, playground"

let strikes = PublishSubject<String>()

let disposeBag = DisposeBag()

strikes.onNext("A")

//
/*
 忽略ignore
 strikes.onNext("A") 无效
 只有当onCompleted 会执行最后一次的subscribe
 */
//ignoreElements

strikes.ignoreElements().subscribe { _ in
    print("call")
}.disposed(by: disposeBag)

strikes.onNext("A")
strikes.onNext("B")
strikes.onNext("C")
strikes.onNext("D")

//
//strikes.onCompleted()



