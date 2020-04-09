//
//  DetailViewController.swift
//  Project1
//
//  Created by Matthew Kennedy on 4/7/20.
//  Copyright © 2020 Matthew Kennedy. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {
    @IBOutlet var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func imageSelected(name: String) {
        imageView.image = NSImage(named: name)
    }
}
