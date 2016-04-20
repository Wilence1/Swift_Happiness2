//
//  DiagnosedHappinessViewControler.swift
//  Psychologist
//
//  Created by Irina Korneeva on 18/04/16.
//  Copyright © 2016 Irina Korneeva. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewControler: HappinessViewController, UIPopoverPresentationControllerDelegate
{
    
    private struct History {
        static let SegueIdentifier = "Show Diagnostic History"
        static let DefaultsKey = "History"
    }
    

    private let defaults = NSUserDefaults.standardUserDefaults()
    //var diagnosticHistory =  [Int]()
    var diagnosticHistory: [Int] {
        get {return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? []}
        set {defaults.setObject(newValue, forKey: History.DefaultsKey)}
    }
    override var happiness: Int {
        didSet {
            diagnosticHistory += [happiness]
        }
    }
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.SegueIdentifier:
                if let tvc = segue.destinationViewController as? TextViewController {
                    if let  ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                    }
                    tvc.text = "\(diagnosticHistory)"
                }
                
            default: break
            }
            
        }
     
    }
    func adaptivePresentationStyleForPresentationController(controller:UIPresentationController) ->UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}
