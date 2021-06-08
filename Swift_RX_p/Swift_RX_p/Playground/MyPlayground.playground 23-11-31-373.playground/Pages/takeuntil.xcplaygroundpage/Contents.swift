import Foundation
import PlaygroundSupport
import RxSwift


var greeting = "Hello, playground"

let strikes = PublishSubject<String>()

let disposeBag = DisposeBag()

let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

subject.takeUntil(trigger).subscribe { new in
    print(" we are new one\(new)")
}.disposed(by: disposeBag)


subject.onNext("A")

trigger.onNext("D")

subject.onNext("B")
subject.onNext("C")
subject.onNext("D")


