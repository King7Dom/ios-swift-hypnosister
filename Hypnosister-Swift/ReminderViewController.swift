//
//  ReminderViewController.swift
//  Hypnosister-Swift
//
//  Created by Dominic's Macbook Pro on 17/10/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ReminderViewController: UIViewController {

    @IBOutlet private weak var datePicker: UIDatePicker?
    @IBOutlet private weak var remindButton: UIButton?


// MARK: Initialization

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        self.tabBarItem.title = "Reminder"
        self.tabBarItem.image = UIImage(named: "time")
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


// MARK: UIButton Delegate

    @IBAction func addReminder(sender: UIButton) {

        // Register Notification Settings
        let notificationSettings = UIUserNotificationSettings(forTypes: .Alert, categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)

        // Create Local Notification
        let notification = UILocalNotification()
        notification.alertBody = "Time to be hypnotized"
        notification.fireDate = self.datePicker?.date

        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }

}
