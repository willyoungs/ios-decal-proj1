//
//  ViewController.swift
//  todoList
//
//  Created by William Youngs on 10/9/16.
//  Copyright © 2016 William Youngs. All rights reserved.
//

import UIKit

class ViewController: UITableViewController,ListDelegate {
    var array = [[String]]()
    var stat = checkStatsViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        self.tableView.register(UITableViewCell.self , forCellReuseIdentifier: "cell")

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Task", style: .plain, target: self, action: "addToDo")
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Stats", style: .plain, target: self, action: "checkStats")
    }
    func checkStats(){
        self.navigationController?.pushViewController(stat, animated: true)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel!.text = array[indexPath.row][0]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            array.remove(at: indexPath.row)
            stat.completed += 1
            tableView.reloadData()
            stat.view.willRemoveSubview(stat.l!)
            stat.viewDidLoad()
        }

    }

    func addToDo(){
        let x = addToDoController()
        x.delegate = self
        self.navigationController?.pushViewController(x, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    func addToList(title:String, content: String) {
        array.append([title,content])
        tableView.reloadData()
    }


}

