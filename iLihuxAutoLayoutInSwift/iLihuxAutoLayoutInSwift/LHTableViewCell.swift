//
//  LHTableViewCell.swift
//  iLihuxAutoLayoutInSwift
//
//  Created by lihux on 14/11/30.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

import UIKit

@objc protocol UITableViewCellDelegate: NSObjectProtocol{
    optional func cancelButton() -> Void
}

class LHTableViewCell: UITableViewCell {

    weak var delegate: UITableViewCellDelegate?

    @IBAction func didTapOnCancelButton(sender: AnyObject)
    {
        if let owner = self.delegate {
            if owner.respondsToSelector(Selector("cancelButton")) {
                owner.cancelButton!()
            }
        }
    }

}
