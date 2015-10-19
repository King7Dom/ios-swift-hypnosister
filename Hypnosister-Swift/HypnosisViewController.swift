//
//  HypnosisViewController.swift
//  Hypnosister-Swift
//
//  Created by Dominic's Macbook Pro on 17/10/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

import UIKit

class HypnosisViewController: UIViewController {
    
    let segmentedControl: UISegmentedControl

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        // Setup UISegmentedControl
        segmentedControl = UISegmentedControl(items: ["red", "green", "blue"])
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        self.tabBarItem.title = "Hypnotize"
        self.tabBarItem.image = UIImage(named: "hypno")
        
        segmentedControl.addTarget(self, action: "changeColor:", forControlEvents: .ValueChanged)
        segmentedControl.backgroundColor = UIColor.whiteColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView() {
        // Load HypnosisView as ViewController's View
        let frame = UIScreen.mainScreen().bounds
        let hypnosisView = HypnosisView(frame: frame)

        self.view = hypnosisView as HypnosisView
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // Add UISegmentedControl as a subView
        let frame = UIScreen.mainScreen().bounds
        let segmentOrigin = CGPoint(x: 8, y: topLayoutGuide.length)
        let segmentSize = CGSize(width: frame.width - 16, height: segmentedControl.frame.height)
        segmentedControl.frame = CGRect(origin: segmentOrigin, size: segmentSize)
        self.view.addSubview(segmentedControl)

        
    }
    
    
    // MARK: Target-Action Methods
    
    func changeColor(sender: UISegmentedControl) {
        if let title = segmentedControl.titleForSegmentAtIndex(segmentedControl.selectedSegmentIndex) {
            let hypnosisView = self.view as! HypnosisView
            
            switch title {
            case "red":
                let color = UIColor.redColor()
                hypnosisView.circleColor = color
                segmentedControl.tintColor = color
            case "green":
                let color = UIColor.greenColor()
                hypnosisView.circleColor = color
                segmentedControl.tintColor = color
            case "blue":
                let color = UIColor.blueColor()
                hypnosisView.circleColor = color
                segmentedControl.tintColor = color
            default:
                break
            }
        }
    }
}
