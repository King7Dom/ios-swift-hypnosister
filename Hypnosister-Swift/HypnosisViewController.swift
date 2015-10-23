//
//  HypnosisViewController.swift
//  Hypnosister-Swift
//
//  Created by Dominic's Macbook Pro on 17/10/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

import UIKit

class HypnosisViewController: UIViewController {
    
    let textField: UITextField


    // MARK: Initialization

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        textField = UITextField()
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        self.tabBarItem.title = "Hypnotize"
        self.tabBarItem.image = UIImage(named: "hypno")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let hypnosisView = HypnosisView(frame: frame)

        self.view = hypnosisView

        textField.borderStyle = .RoundedRect
        textField.placeholder = "Hypnotize me"
        textField.returnKeyType = .Done
        textField.delegate = self
        self.view.addSubview(textField)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        textField.sizeToFit()
        
        let bounds = self.view.bounds
        let textFieldOrigin = CGPoint(x: 8.0, y: self.topLayoutGuide.length)
        let textFieldSize = CGSize(width: bounds.size.width - 16.0, height: textField.frame.height)
        textField.frame = CGRect(origin: textFieldOrigin, size: textFieldSize)
    }


    // MARK:

    func drawHypnoticMessages(message: String) {
        for _ in 0...19 {
            // Create messageLabel to display
            let messageLabel = UILabel()
            messageLabel.backgroundColor = UIColor.clearColor()
            messageLabel.textColor = UIColor.whiteColor()
            messageLabel.text = message
            messageLabel.sizeToFit()

            // Determine the origin of messageLabel
            let width = self.view.bounds.width - messageLabel.bounds.width
            let x = CGFloat(arc4random()) % width
            let height = self.view.bounds.height - messageLabel.bounds.height
            let y = CGFloat(arc4random()) % height

            // Set frame with the determined origin
            var frame = messageLabel.frame
            frame.origin = CGPoint(x: x, y: y)
            messageLabel.frame = frame

            // Add messageLabel to view hierarchy
            self.view.addSubview(messageLabel)
        }
    }
}

extension HypnosisViewController: UITextFieldDelegate {

    func textFieldShouldReturn(textField: UITextField) -> Bool {

        self.drawHypnoticMessages(textField.text!)
        textField.text = ""
        textField.resignFirstResponder()

        return true
    }
}
