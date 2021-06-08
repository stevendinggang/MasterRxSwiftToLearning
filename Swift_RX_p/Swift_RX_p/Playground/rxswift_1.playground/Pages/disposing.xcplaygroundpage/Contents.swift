//: [Previous](@previous)

import Foundation
import RxSwift

var greeting = "Hello, playground"

let disposeBag = DisposeBag()

//let observable4 = Observable.of("A","B","C").subscribe{
//    print($0)
//}.disposed(by: disposeBag)


Observable<String>.create { observer in
    observer.onNext("A")
    observer.onCompleted()
    observer.onNext("?")
    return Disposables.create()
}.subscribe { newOne in
    print(newOne)
} onError: {
    print($0)
} onCompleted: {
    print("onCompleted")
} onDisposed: {
    print("onDisposed")
}

//   PublishSubject
