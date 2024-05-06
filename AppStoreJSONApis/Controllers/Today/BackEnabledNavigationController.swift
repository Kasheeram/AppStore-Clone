//
//  BackEnabledNavigationController.swift
//  AppStoreJSONApis
//
//  Created by kashee on 09/04/24.
//

import UIKit


// Figureout this is not working for me but its working for LBTA code
class BackEnabledNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.viewControllers.count > 1
    }
}
