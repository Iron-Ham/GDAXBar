//
//  TickerViewController.swift
//  GDAXBar
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Cocoa

class TickerViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {

        }
    }

}

extension TickerViewController {
    static func freshController() -> TickerViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "TickerViewController")
        return storyboard.instantiateController(withIdentifier: identifier) as! TickerViewController
    }
}
