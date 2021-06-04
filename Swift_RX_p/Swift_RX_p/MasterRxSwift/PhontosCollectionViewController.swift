//
//  PhontosCollectionViewController.swift
//  Swift_RX_p
//
//  Created by Steven on 2021/6/4.
//

import UIKit
import Photos

class PhontosCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.collectionView.backgroundColor = UIColor.red
        self.view.backgroundColor = UIColor.yellow
        populatePhotos()
    }


    private func populatePhotos() {
        PHPhotoLibrary.requestAuthorization { stauts in
            if stauts == .authorized {
                // access the photos from photo

            }
        }
    }

}
