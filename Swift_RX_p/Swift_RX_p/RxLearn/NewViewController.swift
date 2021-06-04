//
//  NewViewController.swift
//  Swift_RX_p
//
//  Created by Steven on 2021/6/3.
//

import UIKit
import RxSwift
import RxCocoa


class NewViewController: UIViewController {
    let disposeBag = DisposeBag.init()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

extension NewViewController {

    //MARK -
    func addBox() {

        typealias JSON = Any

        guard let url = URL.init(string: "www.baidu.com") else { return }

        let json: Observable<JSON> = Observable.create { (observer) -> Disposable in

//            URLSession.shared.dataTask(with: URLRequest.init(url: URL.init(string: "www.baidu.com") ?? nil))


            let task = URLSession.shared.dataTask(with: URLRequest.init(url: url)) { data, _, error in

                guard error == nil else {
                    observer.onError(error!)
                    return
                }

                guard let data = data,
                    let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                    else {

                    observer.onError(error.unsafelyUnwrapped)

                    return
                }

                observer.onNext(jsonObject)
                observer.onCompleted()
            }

            task.resume()

            return Disposables.create { task.cancel() }
        }



        json.subscribe { json in
            print("123")
        } onError: { error in
            print("\(error)")
        } onCompleted: {
            print("完成")
        }.disposed(by: disposeBag)

    }

    //MARK -
    func addBox2(_ repo: String) -> Single<[String: Any]> {

        return Single<[String: Any]>.create { single in
                let url = URL(string: "https://api.github.com/repos/\(repo)")!
                let task = URLSession.shared.dataTask(with: url) {
                    data, _, error in

                    if let error = error {
                        single(.error(error))
                        return
                    }

                    guard let data = data,
                          let json = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves),
                          let result = json as? [String: Any] else {
                        single(.error(error.unsafelyUnwrapped))
                        return
                    }

                    single(.success(result))
                }
                task.resume()
                return Disposables.create { task.cancel() }
            }
    }

    func addBox4() {

        //AnyObserver 描叙任意一种观察者。
        let observer: AnyObserver<Data> = AnyObserver { (event) in
            switch event {
            case .next(let data):
                print("Data Task Success with count: \(data.count)")
            case .error(let error):
                print("Data Task Error: \(error)")
            default:
                break
            }
        }

//        let url = URL(string: "https://api.github.com/repos/\("")")!
//        let url = URL(string: "https://api.github.com/repos/\("")")!
        let url = URL(string:"https://api.weibo.com/2/comments/show.json")!
        URLSession.shared.rx.data(request: URLRequest(url: url))
            .subscribe(observer)
            .disposed(by: disposeBag)

    }

    //MARK -
    func addBox5() {

        let obserable6 = Completable.create { (completable) -> Disposable in
            let error = NSError(domain: "Completable 失败", code: 0, userInfo: nil)
            completable(.error(error))
            completable(.completed)
            return Disposables.create();
        }

        obserable6.subscribe {
            print("完成")
        } onError: { (error) in
            print(error)
        }


    }

    //MARK -
    func addBox6() {

        func generateString() -> Maybe<String> {
            return Maybe<String>.create { maybe in
                maybe(.success("RxSwift"))

                // OR

                maybe(.completed)

                // OR

                maybe(.error(Error.self as! Error))

                return Disposables.create {}
            }
        }

        generateString()
            .subscribe(onSuccess: { element in
                print("Completed with element \(element)")
            }, onError: { error in
                print("Completed with an error \(error.localizedDescription)")
            }, onCompleted: {
                print("Completed with no element")
            })
            .disposed(by: disposeBag)

    }


    //MARK -
    func addBox7() {

        let button = UIButton.init(frame: CGRect(x: 20, y: 90, width: 100, height: 100))
        button.backgroundColor = UIColor.red
        self.view.addSubview(button)

        let obserable7 = button.rx.tap.asSignal();
//        event = button.rx.tap.asSignal()
        let observerAction: () -> Void = { [self] in tapActin() }
//        event!.emit(onNext: observerAction)

    }

    func tapActin() {
        print("按钮点击弹出")
        let newObserver: () -> Void = { print("内部监听弹窗") }
//        event!.emit(onNext: newObserver)
    }

}
