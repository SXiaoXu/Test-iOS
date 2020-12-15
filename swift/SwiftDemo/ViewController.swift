//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Vivian on 2019/4/19.
//  Copyright © 2019年 Vivian. All rights reserved.
//

import UIKit
import LeanCloud

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        _ = LCSMSClient.requestShortMessage(mobilePhoneNumber: "18804208562", signatureName:"LC测试签名");
        
        
//
//        //构建文件
//        if let url = URL(string: "https://leancloud.cn/assets/imgs/press/Logo%20-%20Blue%20Padding.a60eb2fa.png") {
//            let file = LCFile(url: url)
//            _ = file.save { result in
//                switch result {
//                case .success:
//                    if let value = file.objectId?.value {
//                        print("文件保存完成。objectId: \(value)")
//                    do {
//                        // 构建对象
//                        let todo = LCObject(className: "test")
//                        // 为属性赋值
//                        try todo.set("name", value: "test")
//                        try todo.set("file", value: file)
//                        let options: [LCObject.SaveOption] = [.fetchWhenSave]
//                    // 将对象保存到云端
//                        _ = todo.save(options: options) {(result) in
//                            switch result {
//                            case .success:
//                                print(todo.jsonString);
//                                // 成功保存之后，执行其他逻辑
//                                break
//                            case .failure(error: let error):
//                                // 异常处理
//                                print(error)
//                            }
//                        }
//
//                    } catch {
//                        print(error)
//                    }
//                    }
//                case .failure(error: let error):
//                    print(error)
//                }
//            }
//        }
        
        


/**
 Request a short message.
 - parameter mobilePhoneNumber: The mobile phone number where short message will be sent to.
 - parameter templateName:      The template name.
 - parameter variables:         The variables used to substitute placeholders in template.
 - returns: The result of short message request.
 */
//        _ = LCUser.requestLoginVerificationCode(mobilePhoneNumber: "18804208562")
//        _ = LCSMSClient.requestShortMessage(mobilePhoneNumber: "mobilePhoneNumber", templateName: "", signatureName: "") { (result) in
//            switch result {
//            case .success:
//                break
//            case .failure(error: let error):
//                print(error)
//            }
//        }
//        _ = LCSMSClient.requestShortMessage(mobilePhoneNumber: "18804208562" ) { (result) in
//            switch result {
//            case .success:
//                break
//            case .failure(error: let error):
//                print(error)
//            }
//        }
//
//
//_ = LCSMSClient.requestShortMessage(mobilePhoneNumber: "mobilePhoneNumber", templateName: "你的短信模版", signatureName: "你的短信签名") { (result) in
//    switch result {
//    case .success:
//        break
//    case .failure(error: let error):
//        print(error)
//    }
//}
//
//
//}
//    override func touchesBegan(_ touches: Set<UITouch>, with event:UIEvent?) {
//
//_ = LCUser.signUpOrLogIn(mobilePhoneNumber: "18804208562", verificationCode: "154250", completion: {(result) in
//    switch result {
//    case .success(object: let user):
//        print(user)
//    case .failure(error: let error):
//        print(error)
//    }
//})
      
//        _ = LCSMSClient.verifyMobilePhoneNumber("18804208562", verificationCode: "154250", completion: { (result) in
//            switch result {
//            case .success:
//                break
//            case .failure(error: let error):
//                print(error)
//            }
//        })
    }
    
}



