//
//  ViewController.swift
//  iLihuxAutoLayoutInSwift
//
//  Created by lihux on 14/11/29.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

/**
*  场景1：简单的展示如何通过修改一个view的autolayout来实现动画，其基本思路
*  是通过更改动画view的constraint属性在UIView的animation block中调用
*  setNeedsLayout方法实现动画效果。
*
*  NOTICE: NSLayoutConstraint的active是iOS中新增的特性，在iOS7上无法应用
*  因此做iOS7上的动画时要采用比较不同的方法
*/

import UIKit

class ViewController: UIViewController {

    @IBOutlet var kidLeftCenterConstrait: NSLayoutConstraint!
    @IBOutlet var kidRightCenterConstrait: NSLayoutConstraint!
    @IBOutlet weak var douBi: UIImageView!

    let kAnimationDuration = 0.4
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapOnDoubiButton(sender: AnyObject)
    {
        self.animatedMoveDoubi(true)
    }

    @IBAction func didTapOnWokaoButton(sender: AnyObject)
    {
        self.animatedMoveDoubi(false)
    }

    func animatedMoveDoubi(isLeft: Bool)
    {
        if NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1 {
            self.kidLeftCenterConstrait.active = isLeft
            self.kidRightCenterConstrait.active = !isLeft
            UIView.animateWithDuration(kAnimationDuration, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
        } else {
            let constraintToRemove = isLeft ? self.kidRightCenterConstrait : self.kidLeftCenterConstrait
            let constriaintToUse = isLeft ? self.kidLeftCenterConstrait : self.kidRightCenterConstrait
            self.douBi.superview!.removeConstraint(constraintToRemove)
            self.douBi.superview!.removeConstraint(constriaintToUse)
            self.douBi.superview!.addConstraint(constriaintToUse)
            UIView.animateWithDuration(kAnimationDuration, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

