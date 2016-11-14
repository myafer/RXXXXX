//
//  MoyaTest.swift
//  RXXXXX
//
//  Created by 口贷网 on 16/11/1.
//  Copyright © 2016年 Afer. All rights reserved.
//

import Foundation
import Moya
import RxSwift


extension Response {
    public func mapJSONDictionary(failsOnEmptyData: Bool = true) -> [String: AnyObject]? {
        guard let dd = try? self.mapJSON(failsOnEmptyData: failsOnEmptyData) as? [String : AnyObject] else {
            return ["error": ("222" as Optional<AnyObject>)!]
        }
        return dd
    }
}



private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data //fallback to original data if it cant be serialized
    }
}

private func animationMethod(_ type: NetworkActivityChangeType) -> () {
    switch type {
    case .began:
        print("begin ....")
        UIApplication.shared.delegate?.window??.rootViewController?.view.backgroundColor = UIColor.red
    case .ended:
        print("ended ....")
        UIApplication.shared.delegate?.window??.rootViewController?.view.backgroundColor = UIColor.blue
    }
    
}

let XXProvider = MoyaProvider<XXX>(stubClosure: MoyaProvider.ImmediatelyStub, plugins: [NetworkActivityPlugin(networkActivityClosure: animationMethod)])

public enum XXX {
    case One
    case Two
}

extension XXX: TargetType {
    public var baseURL: URL {
        return URL.init(string: "https://httpbin.org")!
    }
    public var path: String {
        switch self {
            case .One:
                return "/ip"
            case .Two:
                return "/ip"
        }
    }
    public var method: Moya.Method {
        return .GET
    }
    public var parameters: [String: Any]? {
        return nil
    }
    public var sampleData: Data {
        return "{\"origin\":\"2222\",\"arg1\":\"eee\"}".data(using: String.Encoding.utf8)!
    }
    public var task: Task {
        return .request
    }

}

extension XXX {
     func requestt() ->  Observable<IPModel> {
        return Observable.create({ (observer) -> Disposable in
            
            let cancelable = XXProvider.request(.One, completion: { (result) in
                if case let .success(response) = result {
                    observer.onNext(response.JSONModel())
                    observer.onCompleted()
                }
                if case let .failure(error) = result {
                    observer.onError(error)
                }
            })
            
            return Disposables.create {
                cancelable.cancel()
            }
        })
    }
}
