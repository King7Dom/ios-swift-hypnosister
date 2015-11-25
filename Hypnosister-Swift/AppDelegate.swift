//
//  AppDelegate.swift
//  Hypnosister-Swift
//
//  Created by Dominic Cheung on 7/10/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var hypnosisView: HypnosisView?
    var scrollView: UIScrollView?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = RootViewController()
        
        // Create UIScrollView
        let viewFrame = self.window!.bounds
        scrollView = UIScrollView(frame: viewFrame)
        // Create HypnosisView as a subView in scrollView
        hypnosisView = HypnosisView(frame: viewFrame)
        scrollView!.addSubview(hypnosisView!)

        // Setup scrollView
        scrollView!.contentSize = CGSize(width: viewFrame.size.width, height: viewFrame.size.height)
        scrollView!.maximumZoomScale = 2.0
        scrollView!.delegate = self
        
        self.window?.rootViewController?.view.addSubview(scrollView!)
        
        self.window?.backgroundColor = UIColor.whiteColor()
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}


// MARK: UIScrollViewDelegate

extension AppDelegate: UIScrollViewDelegate {

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        if let hypnosisView = hypnosisView where scrollView.subviews.contains(hypnosisView) {
            return hypnosisView
        } else {
            return nil
        }
    }
}