//
//  ViewController.swift
//  Swift_RX_p
//
//  Created by Steven on 2021/6/4.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let disposeBag = DisposeBag()

    @IBOutlet weak var applyFilterBtn: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.yellow

        self.applyFilterBtn.addTarget(self, action: #selector(applyFilterClick), for: .touchUpInside)
    }

}

extension ViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navC = segue.destination  as? UINavigationController, let photosVC = navC.viewControllers.first as? PhontosCollectionViewController else {
            fatalError("segue destination is not found")
        }

        photosVC.selectedPhotot.subscribe { [weak self] image in

            DispatchQueue.main.async {
                self?.updateUI(with: image)
            }
        }.disposed(by: disposeBag)

    }

    //使用Rxswift
    @objc func applyFilterClick() {

        guard let sourceImage = self.photoImageView.image else { return  }

        FilterService().applyFilter(to: sourceImage).subscribe { filterImage in
            DispatchQueue.main.async {
                self.photoImageView.image = filterImage
            }
        }.disposed(by: disposeBag)
    }


    //不使用Rxswift
    @objc func applyFilterClick1() {

        guard let sourceImage = self.photoImageView.image else { return  }
        FilterService().applyFilter(to: sourceImage) { [weak self] filterImage in
            DispatchQueue.main.async {
                self?.photoImageView.image = filterImage
            }
        }

    }

    private  func updateUI(with image:UIImage) {
        self.photoImageView.image = image
        self.applyFilterBtn.isHidden = false

    }
}
