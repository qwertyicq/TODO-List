//
//  Delegates.swift
//  TODO-List
//
//  Created by Nikolay T on 15.06.2021.
//

import Foundation

protocol SaveUserTaskDelegate: AnyObject {
    func saveTask(task: TaskModel)
}

protocol RemoveTaskDelegate: AnyObject {
    func removeTask(task: TaskModel)
}

protocol TaskCompletedDelegate: AnyObject {
  func taskComplet(task: TaskModel)
}
