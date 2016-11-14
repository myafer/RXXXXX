//
//  Response+QdaiBaseModel.swift
//  RXXXXX
//
//  Created by 口贷网 on 16/11/7.
//  Copyright © 2016年 Afer. All rights reserved.
//

import UIKit
import Moya

extension Response {
    public func JSONModel<T: QdaiBaseModel>() -> T {
        return QdaiBaseModel.init(info: self.mapJSONDictionary()) as! T
    }
}
