//
//  TextViewController.swift
//  Psychologist
//
//  Created by Irina Korneeva on 18/04/16.
//  Copyright © 2016 Irina Korneeva. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.text = text
        }
    }
    var text: String = "" {
        didSet {
            textView?.text = text
        }
    }

}
