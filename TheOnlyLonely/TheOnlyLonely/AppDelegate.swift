//
//  AppDelegate.swift
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/13.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//
import UIKit

let APIKey = "c87a0031ce8fc435c3eda104135ccd46"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RESideMenuDelegate{

    var window: UIWindow?
     var viewController: MainViewController?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
         MAMapServices.sharedServices().apiKey = APIKey
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds);
        viewController = MainViewController(nibName: nil, bundle: nil);
        let naviController = UINavigationController(rootViewController: viewController!);
        let leftMenuController = MenuViewController()
        let sideMenuController = RESideMenu(contentViewController: naviController, leftMenuViewController: leftMenuController, rightMenuViewController: nil)
        sideMenuController.delegate = self
        sideMenuController.backgroundImage = UIImage(named: "bg_night_sunny")
        sideMenuController.menuPreferredStatusBarStyle = UIStatusBarStyle.LightContent
        sideMenuController.contentViewShadowColor = UIColor.blackColor()
        sideMenuController.contentViewShadowOffset = CGSizeMake(0, 0)
        sideMenuController.contentViewShadowOpacity = 0.6
        sideMenuController.contentViewShadowRadius = 12
        sideMenuController.contentViewShadowEnabled = true
        
        window!.backgroundColor = UIColor.whiteColor()
        window!.rootViewController = sideMenuController
        window!.makeKeyAndVisible();
        
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

