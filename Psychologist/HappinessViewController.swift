//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Irina Korneeva on 25/02/16.
//  Copyright © 2016 Irina Korneeva. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource
{
    private struct Constants {
        static let happinessGesturescale: CGFloat = 4
    }
    var happiness = 100 {
        didSet{
            happiness = min(max(happiness, 0), 100)
            updateUI()
        }
    }
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = -Int(translation.y/Constants.happinessGesturescale)
            if happinessChange != 0 {
                print(happiness)
                happiness += happinessChange
                print(happiness)
                print(happinessChange)
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
            default: break
        }
    }
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    
    func updateUI()
    {
        faceView?.setNeedsDisplay()
        title = "\(happiness)" 
    }
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double((happiness - 50)/50)
    }
}
