//
//  TaskListTVC.swift
//  TODO-List
//
//  Created by Nikolay T on 15.06.2021.
//

import UIKit

class TaskListTVC: UITableViewController {
    
    private var vc = TaskVC()
    private var arrayUserTasks = [TaskModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    @IBAction func showTaskVC(_ sender: Any) {
        vc = storyboard?.instantiateViewController(identifier: "TaskVC") as! TaskVC
        vc.saveTaskDeleagate = self
        present(vc, animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.arrayUserTasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as? TaskCell else { return UITableViewCell() }
        arrayUserTasks[indexPath.row].currentIndex = indexPath
        let task = arrayUserTasks[indexPath.row]
        cell.cellData(task: task)
        cell.removeTaskDelegate = self
        cell.completeTaskDelegate = self
        
        return cell
    }
    
}


extension TaskListTVC: SaveUserTaskDelegate {
    func saveTask(task: TaskModel) {
        arrayUserTasks.append(task)
        tableView.reloadData()
    }
}

extension TaskListTVC: RemoveTaskDelegate {
    func removeTask(task: TaskModel) {
        guard let index = task.currentIndex?.row else { return }
        self.arrayUserTasks.remove(at: index)
        tableView.reloadData()
    }
}

extension TaskListTVC: TaskCompletedDelegate {
    func taskComplet(task: TaskModel) {
        guard let index = task.currentIndex?.item else { return }
        arrayUserTasks[index].taskCellColor = UIColor.init(red: 0.4666666667, green: 0.7607843137, blue: 0.7019607843, alpha: 1)
        let element = arrayUserTasks.remove(at: index)
        arrayUserTasks.append(element)
        tableView.reloadData()
    }
}
