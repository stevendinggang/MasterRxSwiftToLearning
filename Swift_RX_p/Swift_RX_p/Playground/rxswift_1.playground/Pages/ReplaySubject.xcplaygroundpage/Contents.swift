//: [Previous](@previous)

import Foundation
import RxSwift

var greeting = "Hello, playground"

let disposeBag = DisposeBag()

//   PublishSubject


//: [Next](@next)
let subject0 = PublishSubject<String>()

subject0.onNext("Issue 1")
subject0.subscribe { event in
    print(event)
}

subject0.onNext("Issue 2")
subject0.onNext("Issue 3")


//subject.dispose()
subject0.onCompleted()
subject0.onNext("Issue 4")



//BehaviorSubject 只会subscribe 最后一个value
let subject1 = BehaviorSubject.init(value: "init value")

subject1.onNext("1")
subject1.onNext("2")

subject1.subscribe { event in
    print(event)
}


//ReplaySubject 只会subscribe 倒数最后 bufferSize 个value
//但是 ReplaySubject 如果在后面加,还是会继续打印,这个点可以在判断问题的时候去看,如果大了,肯定是在subscribe后又加了

let subject = ReplaySubject<String>.create(bufferSize: 2)

subject.onNext("1")
subject.onNext("2")
subject.onNext("3")

subject.subscribe { event in
    print(event)
}

subject.onCompleted()

subject.onNext("5")
subject.onNext("7")
subject.onNext("8")

print("--------")

subject.subscribe { event in
    print(event)
}











