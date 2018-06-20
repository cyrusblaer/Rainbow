//
//  NetworkValue.swift
//  GZCC
//
//  Created by Blaer on 2018/5/31.
//  Copyright © 2018 Blaer. All rights reserved.
//

import Foundation
import Alamofire


//// MARK: - Result
public struct NetworkValue<Value> {
    public let isCacheData: Bool
    public let result: Alamofire.Result<Value>
    public let response: HTTPURLResponse?
    init(isCacheData: Bool, result: Alamofire.Result<Value>, response: HTTPURLResponse?) {
        self.isCacheData = isCacheData
        self.result = result
        self.response = response
    }
}
