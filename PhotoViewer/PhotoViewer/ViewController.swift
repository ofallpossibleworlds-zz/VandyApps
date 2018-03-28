//
//  ViewController.swift
//  PhotoViewer
//
//  Created by Robby on 1/23/18.
//  Copyright © 2018 Marshall. All rights reserved.
//

import UIKit

class mainTableController: UITableViewController {
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myFileManager = FileManager.default
        let myPath = Bundle.main.resourcePath!
        let items = try! myFileManager.contentsOfDirectory(atPath: myPath)
        for item in items {
            if item.hasPrefix("IMG") {
                pictures.append(item)
            }
        }
        print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PhotoView") as? PhotoViewController {
            vc.imageName = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}












