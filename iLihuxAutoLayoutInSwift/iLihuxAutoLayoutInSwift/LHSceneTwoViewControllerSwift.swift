//
//  LHSceneTwoViewControllerSwift.swift
//  iLihuxAutoLayoutInSwift
//
//  Created by lihux on 14/11/30.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

import UIKit

class LHSceneTwoViewControllerSwift: UIViewController, UITableViewDelegate, UITableViewDataSource, UITableViewCellDelegate {

    @IBOutlet var emptyView: UIView!
    @IBOutlet weak var tableView: UITableView!

    var tableViewRows = 3

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.customUI()
    }

    func customUI()
    {
        let backgroundView = UIView()
        backgroundView.addSubview(self.emptyView)
        let views = ["backgroundView": self.emptyView]
        self.emptyView.superview?.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[backgroundView]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
        self.emptyView.superview?.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[backgroundView]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))

        self.tableView.backgroundView = backgroundView
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    //program mark - tableview delegates
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        self.tableView.backgroundView?.hidden = self.tableViewRows > 0 ? true : false
        return self.tableViewRows
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("doubi") as LHTableViewCell
        cell.delegate = self
        return cell
    }

    //program mark - tableviewcell delegate
    func cancelButton()
    {
        self.tableViewRows = self.tableViewRows - 1
        self.tableView.reloadData()
    }
}
