import UIKit
import RxSwift
import RxCocoa

enum sex {
    case man
    case woman
}

class Student: NSObject {
   var grade:Int?
   var sex:sex = .man
   var clas:Int = 10

    init(sex:sex,grade:Int,clas:Int) {
        self.sex = sex
        self.grade = grade
        self.clas = clas
    }
}


var greeting = "Hello, playground"

func getSchoolStudents() -> [Student] {
    var array:[Student] = []
    for _ in 0...10 {
//        let stu = Student.init(sex:.man,grade: Int(arc4random_uniform(3)), clas: Int(arc4random_uniform(3)))
        let stu = Student.init(sex:.man,grade: 3, clas: 2)

        array.append(stu)
    }
    return array
}

// 全校学生
let allStudents: [Student] = getSchoolStudents()

// 三年二班的学生
let gradeThreeClassTwoStudents: [Student] = allStudents
    .filter { student in student.grade == 3 && student.clas == 2 }

//print(gradeThreeClassTwoStudents)

let taps: Array<Void> = [(), (), ()]

taps.forEach{
    print("1")
}
let button = UIButton.init(type: .infoDark)

let taps2: Observable<Void> = button.rx.tap.asObservable()

taps2.subscribe { _ in
    print("3333")
} onError: { Error in

} onCompleted: {
    print("new")
} onDisposed: {

}




