//
//  ViewController.swift
//  RXXXXX
//
//  Created by 口贷网 on 16/10/31.
//  Copyright © 2016年 Afer. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        JokeTypeProvider.requestJSON(target: .JokeType)
            .subscribe { re in
            
                print(re)
            }
            .addDisposableTo(disposeBag)
    }



}

