//
//  InternetMasterTableViewController.swift
//  InternetProject
//
//  Created by Phillips, Ryan on 12/14/18.
//  Copyright © 2018 Phillips, Ryan. All rights reserved.
//

import UIKit

class InternetMasterTableViewController: UITableViewController
{
    
    private weak var internetDetail : InternetDetailViewController? = nil
    private lazy var internetTopics : [String] = [String]()
    private lazy var addresses : [String] = [String]()
    
    private func setupDetailContents() -> Void
    {
        internetTopics = [
            "Internet Definitions 🇮🇱",
            "Standard Search Engine ❌🇯🇴",
            "AP CSP 🇺🇸🇮🇱😃",
            "CTEC 🤠",
            "Social media 🤑"
    ]
        addresses = [
            "https://apcentral.collegeboard.org/courses/ap-computer-science-principles/course",
            "http://www.canyonsdistrict.org/",
            "https://ctec.canyonsdistrict.org/",
            "https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html",
            "https://twitter.com/?lang=en"
    ]

        if let splitView = splitViewController
        {
            let currentControllers = splitView.viewControllers
            internetDetail = currentControllers[0] as? InternetDetailViewController
        }
    }
    
    //This method only happens once with the split view
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDetailContents()
        self.clearsSelectionOnViewWillAppear = false
        
        if let split = splitViewController
        {
            let controllers = split.viewControllers
            internetDetail = (controllers[controllers.count-1] as! UINavigationController).topViewController as? InternetDetailViewController
        }
    }
    
    public override func viewWillAppear(_ animated: Bool) -> Void
    {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        
        super.viewWillAppear(animated)
        
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return addresses.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let rowText = internetTopics[indexPath.row]
        cell.textLabel!.text = rowText
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        internetDetail?.detailAddress = addresses[indexPath.row]
        internetDetail?.detailTitle = internetTopics[indexPath.row]
        if (internetDetail != nil)
        {
            splitViewController?.showDetailViewController(internetDetail!, sender: nil)
        }
    }

}
