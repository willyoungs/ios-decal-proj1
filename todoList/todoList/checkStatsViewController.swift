//
//  checkStatsViewController.swift
//  todoList
//
//  Created by William Youngs on 10/16/16.
//  Copyright © 2016 William Youngs. All rights reserved.
//

import UIKit

class checkStatsViewController: UIViewController {
    public var completed = 0
    var l : UILabel? = nil
    override func viewDidLoad() {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        if self.l != nil{
            self.l?.removeFromSuperview()
        }
        self.l = UILabel()
        self.l?.text = "Tasks Completed: \(completed)"
        self.l?.frame = CGRect(x: screenWidth/4.0, y: screenHeight/2, width: screenWidth/2, height:screenHeight/6)
        self.view.addSubview(self.l!)
    }
}
