//
//  PhontosCollectionViewCell.swift
//  Swift_RX_p
//
//  Created by Steven on 2021/6/4.
//

import UIKit

class PhontosCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var imageView: UIImageView!
     var nImageView: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        setUI()

    }



    override init(frame: CGRect) {
        super.init(frame: frame)

        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    init() {
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }


    func setUI(){

        //1、创建一个view
        let nImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        //bgView.isHidden = true
        self.addSubview(nImageView)
        self.nImageView = nImageView

    }

}


extension UIView {
    static func getClassName() -> String {
         return String(describing: type(of: self))
    }
}
