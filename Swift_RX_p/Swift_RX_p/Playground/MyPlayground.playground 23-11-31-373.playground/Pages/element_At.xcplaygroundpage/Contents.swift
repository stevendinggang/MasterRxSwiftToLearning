//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import RxSwift


var greeting = "Hello, playground"

let strikes = PublishSubject<String>()
let disposeBag = DisposeBag()

//选中XXX 执行

//elementAt 仅仅执行第2个
// 加上completed
//打印两次

strikes.elementAt(2).subscribe { string in
    print("you out \(string)")
}.disposed(by: disposeBag)

strikes.onNext("1")
strikes.onNext("2")
strikes.onNext("3")
strikes.onNext("4")
strikes.onNext("5")
strikes.onCompleted()

