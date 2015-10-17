//
//  HypnosisViewController.swift
//  Hypnosister-Swift
//
//  Created by Dominic's Macbook Pro on 17/10/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

import UIKit

class HypnosisViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let hypnosisView = HypnosisView(frame: frame)

        self.view = hypnosisView
    }
}
