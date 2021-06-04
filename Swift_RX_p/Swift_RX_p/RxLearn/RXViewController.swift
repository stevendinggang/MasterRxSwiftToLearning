//
//  RXViewController.swift
//  Swift_RX_p
//
//  Created by Steven on 2021/6/1.
//
//Observable - 可监听序列

import UIKit
import RxSwift
import RxCocoa

class RXViewController: UIViewController {

    let disposeBag = DisposeBag.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.yellow

    }

}


extension RXViewController {
    //MARK -
    func addBox() {
        let btn = UIButton.init(frame: CGRect(x: 20, y: 90, width: 100, height: 100))
        btn.backgroundColor = UIColor.red
        self.view.addSubview(btn)
    }

    func addBox2() {

        let btn = UIButton.init(frame: CGRect(x: 20, y: 90, width: 100, height: 100))
        btn.backgroundColor = UIColor.yellow
        self.view.addSubview(btn)


        //        btn.rx.tap.subscribe(onNext: { [weak self] in
        //            print("点了,小鸡炖蘑菇")
        //            self?.view.backgroundColor = UIColor.orange
        //        })
        //         .disposed(by: disposeBag)

        let taps2: Observable<Void> = btn.rx.tap.asObservable()

        taps2.subscribe { _ in
            print("3333")
        } onError: { Error in

        } onCompleted: {
            print("new")
        } onDisposed: {

        }

    }


    //MARK -
    func addBox3() {

        let minimalPasswordLength = 8

        let passwordOutlet = UITextField.init(frame: CGRect(x: 20, y: 90, width: 100, height: 100))
        let passwordValidOutlet = UILabel.init(frame:  CGRect(x: 120, y: 90, width: 100, height: 100))
        passwordValidOutlet.text = "0000000000000"
        self.view.addSubview(passwordOutlet)
        self.view.addSubview(passwordValidOutlet)

        passwordOutlet.rx.text.orEmpty
            .map { $0.count >= minimalPasswordLength }
            .bind(to: passwordValidOutlet.rx.isHidden)
            .disposed(by: disposeBag)

    }


    //数据bind
    //MARK -
    func addBox4() {

        let imageView = UIImageView.init(frame:  CGRect(x: 120, y: 90, width: 100, height: 100))

        //        let image: UIImage? = UIImage.init(named: "") ?? nil
        //        imageView.image = image

        //        let image: Observable<UIImage> = Observable<UIImage.init()>
        //        image.bind(to: imageView.rx.image)

    }

    //rxswift核心
    //MARK -
    func addBox5() {

        let minimalPasswordLength = 8
        let minimalUsernameLength = 8

        let passwordOutlet = UITextField.init(frame: CGRect(x: 20, y: 90, width: 100, height: 100))
        let usernameOutlet = UITextField.init(frame: CGRect(x: 20, y: 280, width: 100, height: 100))
        let passwordValidOutlet = UILabel.init(frame:  CGRect(x: 220, y: 90, width: 100, height: 100))

        self.view.addSubview(passwordOutlet)
        self.view.addSubview(passwordValidOutlet)
        self.view.addSubview(usernameOutlet)

        passwordOutlet.backgroundColor = UIColor.red
        usernameOutlet.backgroundColor = UIColor.red

        passwordOutlet.tintColor = UIColor.red
        usernameOutlet.tintColor = UIColor.red

        passwordValidOutlet.backgroundColor = UIColor.red
        // Observable<String>
        let text = usernameOutlet.rx.text.orEmpty.asObservable()

        // Observable<Bool>
        let passwordValid = text
            // Operator
            .map { $0.count >= minimalUsernameLength }

        // Observer<Bool>
        let observer = passwordValidOutlet.rx.isHidden

        // Disposable
        let disposable = passwordValid
            // Scheduler 用于控制任务在那个线程队列运行
            .subscribeOn(MainScheduler.instance)
            .observeOn(MainScheduler.instance)
            .bind(to: observer)



        // 取消绑定，你可以在退出页面时取消绑定
        disposable.dispose()
    }

    //MARK -
    func addBox6() {

        let numbers:Observable<Int> = Observable.create { observer -> Disposable in

            observer.onNext(0)
            observer.onNext(1)
            observer.onNext(2)
            observer.onNext(3)
            observer.onNext(4)
            observer.onNext(5)
            observer.onNext(6)
            observer.onNext(7)
            observer.onNext(8)
            observer.onNext(9)
            observer.onCompleted()
            return Disposables.create()
        }

    }

}

