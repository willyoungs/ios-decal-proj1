//
//  addToDoController.swift
//  todoList
//
//  Created by William Youngs on 10/9/16.
//  Copyright © 2016 William Youngs. All rights reserved.
//

import UIKit
class addToDoController: UIViewController, UITextViewDelegate{
    var delegate: ListDelegate? = nil
    var inputText: UITextView!
    var titleText: UITextField!
    
    override func viewDidLoad() {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        self.titleText = UITextField()
        self.titleText.placeholder = "Task Title..."
        self.titleText.frame = CGRect(x:0,y:screenHeight/10,width:screenWidth,height:screenHeight/10)
        self.titleText.backgroundColor = UIColor.white
        self.view.addSubview(self.titleText)
        inputText = UITextView()
        inputText.backgroundColor = UIColor.lightGray
        inputText.frame = CGRect(x:0, y:screenHeight/5, width:screenWidth, height:screenHeight*4/5)
        inputText.delegate = self
        self.view.addSubview(inputText)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: "done")
    }
    func done() {
        delegate?.addToList(title: titleText.text!, content: (inputText?.text)!)
        self.navigationController?.popViewController(animated: true)
    }
}
