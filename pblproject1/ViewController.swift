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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}




