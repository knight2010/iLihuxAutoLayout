//
//  ViewController.swift
//  iLihuxAutoLayoutInSwift
//
//  Created by lihux on 14/11/29.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var kidLeftCenterConstrait: NSLayoutConstraint!
    @IBOutlet var kidRightCenterConstrait: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapOnDoubiButton(sender: AnyObject)
    {
        self.kidLeftCenterConstrait.active = true
        self.kidRightCenterConstrait.active = false
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }

    @IBAction func didTapOnWokaoButton(sender: AnyObject)
    {
        self.kidLeftCenterConstrait.active = false
        self.kidRightCenterConstrait.active = true
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

