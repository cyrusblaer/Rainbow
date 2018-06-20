//
//  UploadManager.swift
//  GZCC
//
//  Created by Blaer on 2018/6/1.
//  Copyright © 2018 Blaer. All rights reserved.
//

import UIKit
import Alamofire

// MARK: - uploadManager
class UploadManager {
    static let `default` = UploadManager()
    /// 上传任务管理
    
    // 当前支持上传图片
    func uploadImg(urlString :String,
                     params:[String:AnyObject]?,
                     imgs: [UIImage],
                     success :@escaping (_ response : [String : AnyObject])->(),
                     progressClosure :@escaping (_ progress : Double)->(),
                     failure : @escaping (_ error : Error)->()) {
         let headers = ["content-type":"multipart/form-data"]
        Alamofire.upload(multipartFormData: { (multiPartFormData) in
            for image in imgs {
                let imageData = self.zipImage(currentImage: image, scaleSize: 1.0, percent: 0.5)
                
                multiPartFormData.append(imageData,
                                         withName: "img",
                                         fileName: "img.png",
                                         mimeType: "image/jpg/png/jpeg")
            }
        }, to: urlString,
           method: .post,
           headers: headers) { (encodingResult) in
            switch encodingResult {
            case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    
                    if let value = response.result.value as? [String: AnyObject]{
                        
                        success(value)
                        
                        print("value---->\(value)")
                    }
                    
                    guard  let data = response.data  else{
                        
                        return
                    }
                    
                    let utf8Text = String(data: data , encoding: .utf8)
                    
                    print("return data" + utf8Text!)
                    
                }
                   upload.uploadProgress { progress in
                      progressClosure(progress.fractionCompleted)
                      print("Upload Progress: \(progress.fractionCompleted)")
              }
            case .failure(let encodingError):
                
                failure(encodingError)
            }
        }
    }
    
    fileprivate func zipImage(currentImage: UIImage,scaleSize:CGFloat,percent: CGFloat) -> Data{
        //压缩图片尺寸
        
        UIGraphicsBeginImageContext(CGSize(width: currentImage.size.width*scaleSize, height: currentImage.size.height*scaleSize))
        currentImage.draw(in: CGRect(x: 0, y: 0, width: currentImage.size.width*scaleSize, height:currentImage.size.height*scaleSize))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        //高保真压缩图片质量
        //UIImageJPEGRepresentation此方法可将图片压缩，但是图片质量基本不变，第二个参数即图片质量参数。
        let imageData = UIImageJPEGRepresentation(newImage, percent)! as Data
        return imageData
    }
}
