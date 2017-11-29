//
//  ViewController.swift
//  SwiftBaseMVVM
//
//  Created by 新龙科技 on 2017/11/29.
//  Copyright © 2017年 新龙科技. All rights reserved.
//

import UIKit
import RxSwift
import NVActivityIndicatorView
let activityIndi​​catorView:NVActivityIndicatorView? = NVActivityIndicatorView(frame: CGRect(x: SCREEN_WIDTH/2-25, y: SCREEN_HEIGHT/2, width: 50, height: 50), type: NVActivityIndicatorType(rawValue: 1), color: UIColor.red, padding: 1.0)
class ViewController: BaseViewController {
    let disposeBag = DisposeBag()
    let viewModel  = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(activityIndi​​catorView!)
        activityIndi​​catorView?.startAnimating()
        let image = UIImage(named: "timg")
        let imageData = UIImageJPEGRepresentation(image!, 0.5)!
        viewModel.getCategories(ImgData:imageData)
            .subscribe({  event in
                switch event {
                case .next(let models):
                    print(models.toJSON())
                    activityIndi​​catorView?.stopAnimating()
                case .error(let error):
                    print(error.localizedDescription)
                    activityIndi​​catorView?.stopAnimating()
                case .completed:
                    return
                }
            }).disposed(by: disposeBag)
    }
}

