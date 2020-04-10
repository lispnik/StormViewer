//
//  SourceViewController.swift
//  Project1
//
//  Created by Matthew Kennedy on 4/7/20.
//  Copyright © 2020 Matthew Kennedy. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    @IBOutlet var tableView: NSTableView!
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        pictures = items.filter { $0.starts(with: "nssl") }
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let view = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
        view.textField?.stringValue = pictures[row]
        view.imageView?.image = NSImage(named: pictures[row])
        return view
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let detailViewController = self.parent?.children[1] as! DetailViewController
        detailViewController.imageSelected(name: pictures[tableView.selectedRow])
    }
}
