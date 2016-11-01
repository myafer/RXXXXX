//
//  RXXNetWorking.swift
//  RXXXXX
//
//  Created by 口贷网 on 16/10/31.
//  Copyright © 2016年 Afer. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
import RxSwift


//public protocol TargetType {
//    var baseURL: NSURL { get }
//    var path: String { get }
//    var method: HTTPMethod { get }
//    var parameters: [String: AnyObject]? { get }
//    var encoding: EncodingType {get}
//    var headers: [String: String]? {get}
//}
//
//public typealias Method         = HTTPMethod
////public typealias ResponseJSON   = DataRequestJSON
//////public typealias ResponseData   = Response<NSData, NSError>
//////public typealias ResponseString = Response<String, NSError>
//public typealias EncodingType   = Alamofire.ParameterEncoding
//
//public class EndPoint<Target:TargetType> {
//}
//
//extension EndPoint {
//    public func request(target:Target) -> Alamofire.DataRequest {
//        let url = target.baseURL.appendingPathComponent(target.path)?.absoluteString
//        let request = Alamofire.request(url!, method: target.method, parameters: target.parameters, encoding: target.encoding, headers: target.headers)
//        return request
//    }
//}
//
//
//public class RXXNetWorking<Target:TargetType> {
//    
//}
//extension RXXNetWorking {
//    public func requestJSON(target: Target) -> Observable<Any> {
//        
//        return Observable.create({ (observer) -> Disposable in//创建信号源
//            let request = EndPoint<Target>().request(target: target)//返回Alamofire.Request类型
//            //Alamofire中responseJSON方法
//            request.responseJSON{ (response) in
//                if let error = response.result.error {
//                    observer.onError(error)
//                } else {
//                    observer.onNext(response.result.value)
//                    observer.onCompleted()
//                }
//            }
//            return Disposables.create {
//                request.cancel()
//            }
//        })
//    }
//}
