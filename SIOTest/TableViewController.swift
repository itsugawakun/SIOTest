//
//  TableViewController.swift
//  SIOTest
//
//  Created by Jerwyn Feria on 10/30/16.
//  Copyright © 2016 itsugawakun. All rights reserved.
//

import UIKit
import SocketIO

//Why didnt this pop up before?
class TableViewController: UITableViewController, UISearchBarDelegate {

    var stopNames = [String]()
    var stopNumbers = [String]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let handlers = SocketHandlers()
    let searchController = UISearchController(searchResultsController: nil)
    var searchTimestamp = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // 2
        // 3
        searchController.hidesNavigationBarDuringPresentation = false
        // 4
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.isActive = false
        
    }
    
    func receivedResults(results: Array<NSDictionary>, requestTimestamp: Int?) {
        print("searchTimestamp: \(searchTimestamp), requestTimestamp: \(requestTimestamp)")
        if searchTimestamp != requestTimestamp! {
            // Ignore any search results other than those for the last search performed
            print("Ignored")
            
            return
        }
        stopNames = []
        stopNumbers = []
        print("Table view")
        for i in 0 ..< results.count {
            print("Stop Name: \(results[i]["Name"] as! String)")
            self.stopNames.append(results[i]["Name"] as! String)
            print("Stop Number: \(results[i]["Number"] as! String)")
            self.stopNumbers.append(results[i]["Number"] as! String)
        }
        
        //print(self.stopNames)
        self.title = "Search Stop"
        tableView.reloadData()
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchTimestamp = self.handlers.searchStop(searchString: searchText, callback: self.receivedResults)
        //tableView.reloadData()

    }
    /*internal func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        stopNames = []
        self.handlers.searchStop(searchString: searchText, callback: self.receivedResults)
        tableView.reloadData()
    }*/
    
    override func viewDidAppear(_ animated: Bool) {
        appDelegate.socket.on("connect") {_ in
            //self.handlers.searchStop(searchString: "king", callback: self.receivedResults)
        }
        
        self.tableView!.dataSource = self
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    //let myTimer : Timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(viewDidAppear(_:)), userInfo: nil, repeats: false)

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.stopNames.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //case .value1 
        // textLabel = left position
        // detailTextLabel = Right Position
        //case .value2
        // textLabel = left position
        // detailTextLabel = print after textLabel
        //case .subtitle
        // textLabel = left position
        // detailTextLabel = grey subtitle
        //defult
        // textLabel = left position only
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = "\(self.stopNames[indexPath.row])"
        cell.detailTextLabel?.text = "Stop \(self.stopNumbers[indexPath.row])"
        cell.accessoryType = .disclosureIndicator
        //print(self.stopNames[indexPath.row])
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
