//
//  FirstViewController.swift
//  SIOTest
//
//  Created by Jerwyn Feria on 10/28/16.
//  Copyright © 2016 itsugawakun. All rights reserved.
//

import UIKit
import SocketIO

class FirstViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel?
    @IBOutlet weak var btn: UIButton?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let handlers = SocketHandlers()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //appDelegate.socket.connect()
        //appDelegate.addHandlers()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func receivedResults(results: Array<NSDictionary>, requestTimestamp: Int?) {
        print(results)
    }
    
    @IBAction func btnClicked(btn: UIButton) {
        handlers.searchStop(searchString: "King", callback: self.receivedResults)
        //appDelegate.socket.emit("stop-search", "King", 1337)
        print("Button clicked!")
    }
    
    /*func addHandlers() {
//        appDelegate.socket.onAny() {event in
//            print("Got event: \(event.event), with items: \(event.items)")
//        }
        
        appDelegate.socket.on("connect") {_ in
            let connect = "Connected"
            //let notConnected = "Not Connected"
            self.label?.text = connect
        }
        
        appDelegate.socket.on("error") {error in
            print("Error: \(error)")
        }
        
        appDelegate.socket.on("stop-search") {data, _ in
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
        }
    }*/


}

