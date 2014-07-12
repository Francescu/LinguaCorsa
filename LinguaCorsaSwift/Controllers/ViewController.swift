//
//  ViewController.swift
//  LinguaCorsaSwift
//
//  Created by Francescu SANTONI on 04/06/2014.
//  Copyright (c) 2014 Francescu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var spinner : UIActivityIndicatorView
    var selectedRow = -1
    var entities:Array<Word> = Word[]() {
    willSet {
        self.tableView.beginUpdates()
        if self.selectedRow >= 0 {
            self.tableView.deselectRowAtIndexPath(NSIndexPath(forRow: self.selectedRow, inSection: 0), animated: true)
            self.selectedRow = -1
        }
        var indexPaths = Array<NSIndexPath>()
        for i in 0..self.entities.count {
            indexPaths.append(NSIndexPath(forRow: i, inSection: 0))
            
        }
        self.tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
        
    }
    didSet {
        var indexPathes = Array<NSIndexPath>()
        for i in 0..self.entities.count {
            indexPathes.append(NSIndexPath(forRow: i, inSection: 0))
        }
        self.tableView.insertRowsAtIndexPaths(indexPathes, withRowAnimation: UITableViewRowAnimation.Automatic)
        self.tableView.endUpdates()
    }
    }
    
    var loading:Bool = false {
    didSet {
        if self.loading {
            self.spinner.startAnimating()
        } else {
            self.spinner.stopAnimating()
        }
    }
    }
    
    @IBOutlet var tableView : UITableView
    @IBOutlet var searchTextField : UITextField
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.searchTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func sendRequest () {
        if self.loading {
            return
        }
        self.loading = true
        AdececDataFetcher.fetchRequest(searchTextField.text, language: Language.French) {
            words, error in
            
            if words {
                self.entities = words!
            }
            
            println(words)
            self.loading = false
        }
        
    }
    
}
extension ViewController:UITextFieldDelegate {
    func textFieldShouldBeginEditing(textField: UITextField!) -> Bool {
        textField.text = ""
        self.entities = []
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {
        self.sendRequest()
        return true
    }
    func textField(textField: UITextField!, shouldChangeCharactersInRange range: NSRange, replacementString string: String!) -> Bool {
        return !self.loading
    }
}

extension ViewController:UITableViewDataSource {
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.entities.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath:NSIndexPath!) -> UITableViewCell! {
        let CellIdentifier = "CellIdentifier"
        var cell:WordTableViewCell! = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as? WordTableViewCell
        if !cell {
            cell = WordTableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: CellIdentifier)
        }
        let entity = self.entities[indexPath.row]
        cell.configure(entity)
        return cell
    }
    
    
}

extension ViewController:UITableViewDelegate {
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
       self.searchTextField.resignFirstResponder()
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        self.searchTextField.resignFirstResponder()
        self.selectedRow = indexPath.row
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        if  self.selectedRow == indexPath.row {
            return 180
        }
        return 100
    }
    
    func tableView(tableView: UITableView!, shouldHighlightRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return indexPath.row != self.selectedRow
    }
    
}
