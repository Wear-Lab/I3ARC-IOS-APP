//
//  AppDelegate.swift
//  Shopping List
//
//  Created by Jacob O'Quinn on 3/24/20.
//  Copyright © 2020 Jacob Oquinn. All rights reserved.
//

import UIKit
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Initialze itemStore
//        let itemStore = ItemStore()
//
//        // TEMP
//        let itemsNotPurchased = [Item.init(purchased: false, name: "Lemon", quantity: 10, image: #imageLiteral(resourceName: "20fd77c03f1733d27bcc98e2e9160d43"))]
//        let itemsPurchased = [Item.init(purchased: true, name: "Other Lemon", quantity: 10, image: #imageLiteral(resourceName: "20fd77c03f1733d27bcc98e2e9160d43"))]
//        
//        itemStore.items = [itemsNotPurchased, itemsPurchased]
        // FIXME: Could not get to work
        // Grab the ShoppingListViewController
       // let ShoppingListViewController =
        
        // Set the itemStore accordingly
       // ShoppingListViewController.itemStore = itemStore
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

