//
//  ViewController.swift
//  RXXXXX
//
//  Created by 口贷网 on 16/10/31.
//  Copyright © 2016年 Afer. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    let label = UILabel(frame: CGRect(x: 20, y: 100, width: 200, height: 20))

    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0...0 {
            req()
        }
        self.view.addSubview(label)
    }
    
    func req() {
        Cancelable
        XXProvider.request(<#T##target: XXX##XXX#>, completion: <#T##Completion##Completion##(Result<Response, Error>) -> ()#>)
        XXProvider.request(.One) { result in
            if case let .success(response) = result {
                let model = IPModel(info: response.mapJSONDictionary()!)
                self.label.text = model.arg1
                print(model)
            }
            if case let .failure(error) = result {
                print(error)
            }
        }

    }
    
}

