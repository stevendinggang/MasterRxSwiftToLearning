import Foundation
import PlaygroundSupport
import RxSwift


var greeting = "Hello, playground"

let strikes = PublishSubject<String>()
let disposeBag = DisposeBag()

//Observable.of(0,1,2,3,4,5,6,7,8).filter { $0 < 5 }.subscribe { new in
//   print("\(new)")
//}.disposed(by: disposeBag)

//skip 在 xx 后面多少个

Observable.of(0,1,2,3,4,5,6,7,8).skip(2).subscribe { new in
    print(" we are new one\(new)")
}.disposed(by: disposeBag)

let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

//skipUntil trigger之前的数据都不展示,仅仅展示 关键节点后面的数据
subject.skipUntil(trigger).subscribe { new in
    print(" we are new one\(new)")
}.disposed(by: disposeBag)


subject.onNext("A")

trigger.onNext("D")

subject.onNext("B")
subject.onNext("C")
subject.onNext("D")

/*
 we are new onenext(B)
 we are new onenext(C)
 we are new onenext(D)
*/



