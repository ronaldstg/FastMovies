//
//  UIViewControllerExtensions.swift
//  FastMovies
//
//  Created by Ronald on 11/02/20.
//  Copyright © 2020 ronald. All rights reserved.
//

import UIKit

var spinnerLoadingView : UIView?
 
extension UIViewController {
    
    func showLoading(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let ai = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        spinnerLoadingView = spinnerView
    }
    
    func removeLoading() {
        DispatchQueue.main.async {
            spinnerLoadingView?.removeFromSuperview()
            spinnerLoadingView = nil
        }
    }
    
}
