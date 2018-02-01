//
//  UIAlertControllerExtension.swift
//  WKWebView
//
//  Created by 林　翼 on 2018/02/01.
//  Copyright © 2018年 Tsubasa Hayashi. All rights reserved.
//

import UIKit


// MARK: extension UIAlertController
extension UIAlertController {
    /// Create simple alert with OK, Cancel
    static internal func makeSimpleAlert(_ title: String?, message: String?, okTitle: String?, okAction: ((UIAlertAction) -> Void)? ,cancelTitle: String?, cancelAction: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // OK
        if let okTitle = okTitle {
            let okAction = UIAlertAction(title: okTitle, style: .default, handler: okAction)
            alertController.addAction(okAction)
        }
        // Cancel
        if let cancelTitle = cancelTitle {
            let cancelAction = UIAlertAction(title: cancelTitle, style: .default, handler: cancelAction)
            alertController.addAction(cancelAction)
        }

        return alertController
    }
}
