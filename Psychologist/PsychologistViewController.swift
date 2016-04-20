//
//  ViewController.swift
//  Psychologist
//
//  Created by Irina Korneeva on 17/04/16.
//  Copyright © 2016 Irina Korneeva. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController
{
    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: nil)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        if let hvc = destination as? HappinessViewController {
            if let identif = segue.identifier {
                switch identif {
                    case "sad": hvc.happiness = 0
                    case "happy": hvc.happiness = 100
                    default: hvc.happiness = 50
                }
            }
        }
    }


}

