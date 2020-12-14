//
//  TaskObjects.swift
//  BackgroundTaskChanger
//
//  Created by cpsc on 11/9/20.
// this object saves all the tasks
// we will save the "task manager" object instead of tasks individually

import Foundation
import UIKit

struct TaskManager: Codable {
    static var taskCollection: [Task] = []
}
struct Task: Codable {
    var title: String = ""
    var date: String = ""
    var notes: String = ""
    
    /*func GetHex() -> String{//make hexcode
        return String(format: "%02lX%02lX%02lX%02lX",
                      self.red,
                      self.green,
                      self.blue,
                      self.alpha
        )
    }*/
    //make image of a size and shape and fill it with a task
    /*func GetTask() -> UIImage {
        
        //this needs to return the task not an image
       
    }*/
    
}

