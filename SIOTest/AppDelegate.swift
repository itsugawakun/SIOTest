//
//  AppDelegate.swift
//  SIOTest
//
//  Created by Jerwyn Feria on 10/28/16.
//  Copyright © 2016 itsugawakun. All rights reserved.
//

import UIKit
import SocketIO

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?
    let socket = SocketIOClient(socketURL: URL(string: "ws://thebus-smiley43210.rhcloud.com")!)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        socket.connect()
        addHandlers()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    func addHandlers() {
        //        appDelegate.socket.onAny() {event in
        //            print("Got event: \(event.event), with items: \(event.items)")
        //        }
        
        socket.on("connect") {_ in
            print("Connected")
        }
        
        socket.on("error") {error in
            print("Error: \(error)")
        }
        
        /*socket.on("stop-search") {data, _ in
            print("Received search results \(type(of: data[0]))")
            
            var results: [NSDictionary] = []
            
            let stopResults = data[0] as! NSArray
            //let stopResult = stopResults[0] as! NSDictionary
            
            for i in 0 ..< stopResults.count {
                results.append(stopResults[i] as! NSDictionary)
            }
            
            for i in 0 ..< results.count {
                print("Stop Name: \(results[i]["Name"] as! String)")
            }
            
            print(stopResults.count)
            
            //print("Stop result \(stopResult)")
            //print("Name: \(stopResult["Name"] as! String)")
        }*/
    }



}

