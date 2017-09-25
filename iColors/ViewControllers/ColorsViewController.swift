//
//  ColorsViewController.swift
//  iColors
//
//  Created by Sunil Sharma on 9/25/17.
//  Copyright © 2017 Sunil Sharma. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {
    @IBOutlet weak var colorPlateView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPanGesture(view: self.colorPlateView)
    }
    
    func addPanGesture(view:UIView) {
        let panGestureRecogniser = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(sender:)))
        view.addGestureRecognizer(panGestureRecogniser)
    }

    func handlePanGesture(sender:UIPanGestureRecognizer) {
        if let senderView = sender.view {
            //let translation = sender.translation(in: senderView)
            //let point = CGPoint(x: (sender.view?.center.x)! + translation.x, y: (sender.view?.center.y)! + translation.y)
            let point = sender.location(in: senderView)
            print("location in view = \(sender.location(in: senderView))")
            print("transaltion x = \(point.x) y = \(point.y)")
            let hue = point.y / senderView.frame.height
            let saturation = point.x / senderView.frame.width
            switch sender.state {
            case .began, .changed:
                self.view.backgroundColor = UIColor(hue: hue , saturation: saturation, brightness: 1.0, alpha: 1.0)
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























