//
//  ViewController.swift
//  pblproject1
//
//  Created by Chiaki Yuge on 2019/10/02.
//  Copyright © 2019 Chiaki Yuge. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        print(pictures)
    }


}

