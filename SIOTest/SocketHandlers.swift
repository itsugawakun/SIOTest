//
//  SocketHandlers.swift
//  SIOTest
//
//  Created by Jerwyn Feria on 10/30/16.
//  Copyright © 2016 itsugawakun. All rights reserved.
//

import SocketIO

class SocketHandlers  {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //let firstController = FirstViewController()
    
    func searchStop(searchString: String!, callback: @escaping ((Array<NSDictionary>, Int?) -> Void)) -> Int {
        appDelegate.socket.once("stop-search") {data, _ in
            print("Received search results \(type(of: data[0]))")
            
            var results: [NSDictionary] = []
            let stopResults = data[0] as! NSArray
            //let stopResult = stopResults[0] as! NSDictionary
            
            for i in 0 ..< stopResults.count {
                results.append(stopResults[i] as! NSDictionary)
            }
            
//            for i in 0 ..< results.count {
//                print("Stop Name: \(results[i]["Name"] as! String)")
//            }
            
//            print(stopResults.count)
            
            //print("Stop result \(stopResult)")
            //print("Name: \(stopResult["Name"] as! String)")
            
            if data.count > 1 {
                callback(results, data[1] as? Int)
            } else {
                callback(results, nil)
            }
        }
        //Can we Math.floor this?
        let searchTimestamp = Int(NSDate().timeIntervalSince1970 * 1000)
        appDelegate.socket.emit("stop-search", searchString as String, searchTimestamp)
        return (searchTimestamp)
    }
    
}
