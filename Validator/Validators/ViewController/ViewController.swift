//
//  ViewController.swift
//  ValidatorsMediumPost
//
//  Created by Sheraz Rasheed on 07/10/2019.
//  Copyright © 2019 IBITWAY Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customView: SRView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func validateAction(_ sender: Any) {
      
        self.customView.validate()
    }
}



