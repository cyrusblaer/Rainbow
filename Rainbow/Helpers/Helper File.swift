//
//  Helper File.swift
//  Rainbow
//
//  Created by Blaer on 2018/4/26.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import Foundation
import UIKit


//Global variables
struct GlobalVariables {
    static let orange = UIColor.rbg(r: 228, g: 74, b: 8)
    static let grey = UIColor.rbg(r: 241, g: 242, b: 245)
    static let tableGrey = UIColor.rbg(r: 235, g: 237, b: 240)
}

//Extensions
extension UIColor{
    class func rbg(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        let color = UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
        return color
    }
}

//Enums

enum LoginPageType {
    case none
    case login
    case register
    case fillinfo
}

enum PhotoSource {
    case library
    case camera
}

enum MessageType {
    case photo
    case text
    case location
}
