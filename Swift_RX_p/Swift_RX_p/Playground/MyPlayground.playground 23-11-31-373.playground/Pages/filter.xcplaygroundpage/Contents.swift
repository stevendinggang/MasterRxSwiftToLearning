//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import RxSwift


var greeting = "Hello, playground"

let strikes = PublishSubject<String>()
let disposeBag = DisposeBag()

Observable.of(0,1,2,3,4,5,6,7,8).filter { $0 < 5 }.subscribe { new in
   print("\(new)")
}.disposed(by: disposeBag)
