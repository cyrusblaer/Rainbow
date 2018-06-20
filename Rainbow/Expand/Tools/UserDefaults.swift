//
//  UserDefaults.swift
//  GZCC
//
//  Created by Blaer on 2018/5/31.
//  Copyright © 2018 Blaer. All rights reserved.
//

import Foundation

protocol UserDefaultsSettable {
    associatedtype defaultKeys: RawRepresentable
}

extension UserDefaultsSettable where defaultKeys.RawValue==String {
    static func set(value: String?, forKey key: defaultKeys) {
        let aKey = key.rawValue
        UserDefaults.standard.set(value, forKey: aKey)
    }
    static func string(forKey key: defaultKeys) -> String? {
        let aKey = key.rawValue
        return UserDefaults.standard.string(forKey: aKey)
    }
    
}

// 以结构体存取数据
extension UserDefaults {
    // 账户信息
    struct AccountInfo: UserDefaultsSettable {
        enum defaultKeys: String {
            case userName
            case passWord
        }
    }
    
    // 登录信息
    struct LoginInfo: UserDefaultsSettable {
        enum defaultKeys: String {
            case token
            case userId
        }
    }
}

