//
//  ListDelegate.swift
//  todoList
//
//  Created by William Youngs on 10/9/16.
//  Copyright © 2016 William Youngs. All rights reserved.
//

import Foundation

@objc protocol ListDelegate{
    func addToList(title:String, content: String)
}
