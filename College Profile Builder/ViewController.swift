//
//  ViewController.swift
//  College Profile Builder
//
//  Created by Yasoob  Rasheed on 7/6/15.
//  Copyright © 2015 Yasoob Rasheed. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var colleges : [College] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.tag = 0
        colleges.append(College(name: "University of Chicago", city: "Chicago", state: "Illinois", enrollment: 8.8, image: UIImage(named: "uofc")!, url: NSURL(string: "http://uchicago.edu")!))
        colleges.append(College(name: "Northwestern University", city: "Evanston", state: "Illinois", enrollment: 14.2, image: UIImage(named: "nu")!, url: NSURL(string: "http://northwestern.edu")!))
        colleges.append(College(name: "University of Illinois Urbana Champaign", city: "Champaign", state: "Illinois", enrollment: 62.39, image: UIImage(named: "ofiuc")!, url: NSURL(string: "http://illinois.edu")!))
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = colleges[indexPath.row].name
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            colleges.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    
    @IBAction func onTappedEditButton(sender: UIBarButtonItem) {
        if editButton.tag == 0 {
            myTableView.editing = true
            editButton.tag = 1
        } else {
            myTableView.editing = false
            editButton.tag = 0
        }
        
    }
    @IBAction func onTappedPlusButton(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add college here"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.Default, handler: {(action) -> Void in
            let collegeTextField = alert.textFields![0] as UITextField
            self.colleges.append(College(name: collegeTextField.text!))
            self.myTableView.reloadData()
        })
        alert.addAction(addAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! DetailViewController
        let index = myTableView.indexPathForSelectedRow?.row
        dvc.college = colleges[index!]
    }
}




