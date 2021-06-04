//
//  ViewController+Extention.swift
//  Swift_RX_p
//
//  Created by Steven on 2021/5/28.
//

import Foundation
import UIKit

extension UIViewController {

    @objc func injected() {
        self.viewDidLoad()

//        NotificationCenter.default.addObserver(self,
//            selector: #selector(configureView),
//            name: Notification.Name("INJECTION_BUNDLE_NOTIFICATION"), object: nil)
    }



    //MARK -
   @objc func configureView() {
      self.viewDidLoad()
    }



}
