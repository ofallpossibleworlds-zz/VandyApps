//
//  ViewController.swift
//  Spring Vandyapps Test
//
//  Created by Robby on 1/22/18.
//  Copyright © 2018 Marshall. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let myFileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let itemsInFolder = try! myFileManager.contentsOfDirectory(atPath: path)
        
        for item in itemsInFolder {
            if item.hasPrefix("IMG") {
                pictures.append(item)
            }
        }
        print(pictures)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PhotoView") as? MyPhotoViewController {
            vc.imageName = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}


