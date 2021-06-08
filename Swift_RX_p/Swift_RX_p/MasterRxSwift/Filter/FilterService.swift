//
//  FilterService.swift
//  Swift_RX_p
//
//  Created by Steven on 2021/6/7.
//

import UIKit
import CoreImage
import RxSwift


typealias action = ((UIImage) -> Void)

class FilterService {

    let disposeBag = DisposeBag()

    private var contenx:CIContext

    init() {
        self.contenx = CIContext()
    }

    func applyFilter(to inputImage:UIImage) -> Observable<UIImage> {

        return Observable<UIImage>.create { observer in
            self.applyFilter(to: inputImage) { filterImage in
                observer.onNext(filterImage)
            }
            return Disposables.create()
        }
    }

    func applyFilter(to inputImage:UIImage, completion: @escaping action) {
        let filter = CIFilter(name: "CICMYKHalftone")!
        filter.setValue(0.5, forKey: kCIInputWidthKey)
         if let sourceImage = CIImage.init(image: inputImage) {
            filter.setValue(sourceImage, forKey: kCIInputImageKey)
            if let cgimg = self.contenx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent) {
                let prcessedImage = UIImage.init(cgImage: cgimg,scale: inputImage.scale,orientation: inputImage.imageOrientation)
                completion(prcessedImage)
            }
        }



    }

}
