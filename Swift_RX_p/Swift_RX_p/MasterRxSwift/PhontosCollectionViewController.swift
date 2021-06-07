//
//  PhontosCollectionViewController.swift
//  Swift_RX_p
//
//  Created by Steven on 2021/6/4.
//

import UIKit
import Photos

class PhontosCollectionViewController: UICollectionViewController {

    private var images:[PHAsset] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.collectionView.backgroundColor = UIColor.red
        self.view.backgroundColor = UIColor.yellow
        setCollectionView()
        populatePhotos()
    }


    private func populatePhotos() {
        PHPhotoLibrary.requestAuthorization { [weak self]  stauts in
            if stauts == .authorized {
                // access the photos from photo
                let assets = PHAsset.fetchAssets(with: .image, options: nil)

                assets.enumerateObjects { ( object, count, stop ) in
                    self?.images.append(object)
                }

                self?.images.reverse()
                print(self?.images ?? nil)

                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        }
    }

    //MARK -
    func setCollectionView() {

        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        // Cell的大小
        layout.itemSize = CGSize(width: 160, height: 160)
        // 同一列Cell之間的間距
        layout.minimumInteritemSpacing = 18
        // 列和列之間的間距
        layout.minimumLineSpacing = 18
        // Section的邊界
        layout.sectionInset = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)

//        self.collectionView.register(UINib.init(nibName: "PhontosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhontosCollectionViewCell")

        self.collectionView.register(PhontosCollectionViewCell.self, forCellWithReuseIdentifier: "PhontosCollectionViewCell")

        self.collectionView.delegate = self
        collectionView.dataSource = self

    }

}

//数据delegate
//UICollectionViewDelegate,UICollectionViewDataSource

extension PhontosCollectionViewController {

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell:PhontosCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhontosCollectionViewCell", for: indexPath) as! PhontosCollectionViewCell

        let asset = self.images[indexPath.row]
        let mananger = PHImageManager.default()

        cell.backgroundColor = UIColor.green
        mananger.requestImage(for: asset, targetSize: CGSize.init(width: 100, height: 100), contentMode: .aspectFit, options: nil) { image, _ in

            DispatchQueue.main.async {
                if let imageV:UIImage = image {
//                    cell.imageView.image = imageV
                    cell.nImageView?.image = imageV
                }
            }
        }

        return cell
    }

}



