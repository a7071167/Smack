//
//  ChatVC.swift
//  Smack
//
//  Created by user on 03.08.2018.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    // Outlets
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer((self.revealViewController().panGestureRecognizer()))
        self.view.addGestureRecognizer((self.revealViewController().tapGestureRecognizer()))
        
    }
    
    



}
