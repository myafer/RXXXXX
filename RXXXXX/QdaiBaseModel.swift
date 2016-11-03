//
//  QdaiBaseModel.swift
//  Qdai2
//
//  Created by 口贷网 on 16/1/14.
//  Copyright © 2016年 1211. All rights reserved.
//

import UIKit



class QdaiBaseModel: NSObject {
    
    var selfDic: [String: AnyObject?]?
    
    lazy var mirror: Mirror = {Mirror(reflecting: self)}()
    
    init(info: [String: AnyObject?]?) {
        super.init()
        if info == nil {
            return
        }
        for p in mirror.children {
            
            let va = info![p.label!]
            let ke = p.label!
            
            if (va is NSArray || va is NSMutableArray) {
                self.setValue(va, forKeyPath: ke)
            } else if va is String {
                self.setValue(QdaiBaseModel.anyObjectToString(any: (va as AnyObject?)!), forKeyPath: ke)
            } else {
                
            }
            
        }
    }
    
    func toDictionary() -> NSMutableDictionary {
        let mdic: NSMutableDictionary = NSMutableDictionary()
        for p in mirror.children {
            mdic.setValue( self.value(forKeyPath: p.label!) , forKeyPath:  p.label!)
        }
        
        return mdic
    }
    
    override var description: String {
        var restr =     "##############  \(type(of: self)) description ###############\n"
        for p in mirror.children {
            restr = restr + "\(p.label!)    = \(p.value)\n"    + "----------------------\n"
        }
        restr = restr + "######################## description end #######################\n"
        return restr
    }
    
    class func anyObjectToString(any: AnyObject?) -> String {
        if any is NSNumber {
            return NSString(format: "%@", any as! NSNumber) as String
        } else if any is String {
            return any as! String
        } else if any is NSString {
            return any as! String
        } else {
            print("ERROR: Type is error")
            return ""
        }
    }
}
