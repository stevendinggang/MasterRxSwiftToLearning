//
//  ViewController.swift
//  Swift_RX_p
//
//  Created by Steven on 2021/5/28.
//

import UIKit
import RxSwift
import RxCocoa


public enum Event<Element> {
    case next(Element)
    case error(Swift.Error)
    case completed

class SBViewController: UIViewController {

    @IBOutlet weak var newApply: UIButton!

    let disposeBag = DisposeBag.init()
    let passwordOutlet = UITextField.init(frame: CGRect(x: 20, y: 90, width: 100, height: 100))
    let usernameOutlet = UITextField.init(frame: CGRect(x: 20, y: 280, width: 100, height: 100))
    let passwordValidOutlet = UILabel.init(frame:  CGRect(x: 220, y: 90, width: 100, height: 100))
    let usernameValidOutlet = UILabel.init(frame:  CGRect(x: 220, y: 90, width: 100, height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//      setUpUI()
        setUpNavUI()
        addBox70()
    }

    func setUpNavUI() {
        self.view.backgroundColor = UIColor.red
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }


    func setUpUI() {
        usernameValidOutlet.text = "2222"
        self.view.addSubview(passwordOutlet)
        self.view.addSubview(passwordValidOutlet)
        self.view.addSubview(usernameOutlet)
        self.view.addSubview(usernameValidOutlet)
    }


    func addBox70() {
//       let new = RXViewController.init()
         usernameValidOutlet.text = "222wwwwwwww2"
         newApply.titleLabel?.text = "3333333"
         self.view.addSubview(usernameValidOutlet)
//      self.navigationController?.pushViewController(new, animated: false)
    }

}




}
