//
//  Observable+QdaiBaseModel.swift
//  RXXXXX
//
//  Created by 口贷网 on 16/11/7.
//  Copyright © 2016年 Afer. All rights reserved.
//

import UIKit
import RxSwift
import Moya

extension ObservableType where E == Response {

     public func JSONModel<T: QdaiBaseModel>(type: T.Type) -> Observable<T> {
        return flatMap({ (response) -> Observable<T> in
            return response.mapJSONDictionary() as Any as! Observable<T>
        })
    }
}
