//
//  MyPhotoViewController.swift
//  Spring Vandyapps Test
//
//  Created by Robby on 2/6/18.
//  Copyright © 2018 Marshall. All rights reserved.
//

import UIKit

class MyPhotoViewController: UIViewController {

    @IBOutlet var myPhoto: UIImageView!
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageToLoad = imageName {
            myPhoto.image  = UIImage(named: imageToLoad)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
