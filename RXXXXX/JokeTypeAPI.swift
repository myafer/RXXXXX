//
//  JokeTypeApi.swift
//  RXXXXX
//
//  Created by 口贷网 on 16/10/31.
//  Copyright © 2016年 Afer. All rights reserved.
//

import UIKit
import Alamofire

let JokeTypeProvider = RXXNetWorking<JokeTypeAPI>()

public enum JokeTypeAPI {
    case JokeType
}

extension JokeTypeAPI: TargetType {
    
    public var baseURL: NSURL { return NSURL(string: "http://japi.juhe.cn/funny/type.from")!}
    public var path: String {
        switch self {
        case .JokeType:
            return "?key=5a0b9fec22213e40a429b38c33d989e0"
        default:
            return "" 
        }
    }

    public var method: HTTPMethod {
        return .get
    }
    public var parameters: [String: AnyObject]? {
        return nil
    }
    public var encoding: EncodingType {
        return URLEncoding.default
    }
    public var headers: [String : String]? {
        return nil
    }
}
