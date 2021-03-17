//
//  ImageZoomViewController.swift
//  PhotosExample_Review
//
//  Created by 하동훈 on 2021/03/17.
//

import UIKit
import Photos

class ImageZoomViewController: UIViewController {
    
    var asset: PHAsset!
    let imageManager = PHCachingImageManager()
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        imageManager.requestImage(for: asset,
                                  targetSize: CGSize(width: asset.pixelWidth,
                                                     height: asset.pixelHeight),
                                  contentMode: .aspectFill, options: nil,
                                  resultHandler: { (image, _) in
                                    self.imageView.image = image
                                  })
    }

}

extension ImageZoomViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}
