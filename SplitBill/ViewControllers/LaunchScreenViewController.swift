//
//  LaunchScreenViewController.swift
//  SplitBill
//
//  Created by Emmie Ohnuki on 7/20/18.
//  Copyright © 2018 Emmie Ohnuki. All rights reserved.
//

import Foundation
import UIKit

class LaunchScreenViewController: UIViewController {
    
    @IBOutlet weak var beginButton: UIButton!
    
    func setupViews() {
        beginButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        beginButton.layer.shadowOpacity = 0.05
        beginButton.layer.shadowColor = UIColor.black.cgColor
        beginButton.layer.shadowRadius = 35
        beginButton.layer.cornerRadius = 8
        beginButton.layer.masksToBounds = true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}
