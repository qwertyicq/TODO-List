//
//  TaskCell.swift
//  TODO-List
//
//  Created by Nikolay T on 15.06.2021.
//

import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var someTask: UILabel!
    
    weak var removeTaskDelegate: RemoveTaskDelegate?
    weak var completeTaskDelegate: TaskCompletedDelegate?
    
    var task: TaskModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func removeTaskBtnPressed(_ sender: Any) {
        guard let task = self.task else { return }
        removeTaskDelegate?.removeTask(task: task)
    }
    
    @IBAction func executeTaskBtnPressed(_ sender: Any) {
        guard let task = self.task else { return }
        completeTaskDelegate?.taskComplet(task: task)
    }
    
    func cellData(task: TaskModel) {
        someTask.text = task.taskName
        viewCell.backgroundColor = task.taskCellColor
        self.task = task
    }
}
