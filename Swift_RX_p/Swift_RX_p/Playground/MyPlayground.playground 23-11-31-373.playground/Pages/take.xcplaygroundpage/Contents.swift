import Foundation
import PlaygroundSupport
import RxSwift


var greeting = "Hello, playground"

let strikes = PublishSubject<String>()
let disposeBag = DisposeBag()

Observable.of(0,1,2,3,4,5,6,7,8).take(2).subscribe { new in
    print(" we are new one\(new)")
}.disposed(by: disposeBag)

