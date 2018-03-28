//
//  PhotoViewController.swift
//  PhotoViewer
//
//  Created by Robby on 2/6/18.
//  Copyright © 2018 Marshall. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet var myImageView: UIImageView!
    var imageName : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageToLoad = imageName {
            myImageView.image  = UIImage(named: imageToLoad)
        } else {
            print("HELP")
        }
    }
}
