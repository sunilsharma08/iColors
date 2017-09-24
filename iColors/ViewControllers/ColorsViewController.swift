//
//  ColorsViewController.swift
//  iColors
//
//  Created by Sunil Sharma on 9/25/17.
//  Copyright © 2017 Sunil Sharma. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addPanGesture(view: self.view)
    }
    
    func addPanGesture(view:UIView) {
        let panGestureRecogniser = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(sender:)))
        view.addGestureRecognizer(panGestureRecogniser)
    }

    func handlePanGesture(sender:UIPanGestureRecognizer) {
        if let senderView = sender.view {
            let translation = sender.translation(in: senderView)
            switch sender.state {
            case .began, .changed:
                self.view.backgroundColor = UIColor(red: translation.x / 255.0, green: 0.0, blue: translation.y / 255.0, alpha: 1.0)
            case .ended:
                break
            default:
                break
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}























