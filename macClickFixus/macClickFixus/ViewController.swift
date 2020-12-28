//
//  ViewController.swift
//  macClickFixus
//
//  Created by Admin on 28.12.2020.
//

import Cocoa


class ViewController: NSViewController {

    
    @IBAction func clickQuit(_ sender: Any) {
        exit(0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

