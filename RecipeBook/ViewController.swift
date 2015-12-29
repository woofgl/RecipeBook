//
//  ViewController.swift
//  RecipeBook
//
//  Created by woofgl on 15/12/22.
//  Copyright © 2015年 woofgl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!

    var recipes: [String] = []
    var searchResults: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        recipes = ["Egg Benedict 9", "Mushroom Risotto", "Full Breakfast", "Hamburger", "Ham and Egg Sandwich", "Creme Brelee", "White Chocolate Donut", "Starbucks Coffee", "Vegetable Curry", "Instant Noodle with Egg", "Noodle with BBQ Pork", "Japanese Noodle with Pork", "Green Tea", "Thai Shrimp Cake", "Angry Birds Cake", "Ham and Cheese Panini", ""]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.searchDisplayController!.active {
            return searchResults.count
        } else {
            return recipes.count
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "RecipeCell"
        let cellOpt:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier);
        let cell:UITableViewCell
        if (cellOpt != nil){
            cell = cellOpt!;
        }else{
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: identifier)
        }

        if self.searchDisplayController!.active {
            if searchResults.isEmpty {
                cell.textLabel?.text = ""
            }else{
                cell.textLabel?.text = self.searchResults[indexPath.row]
            }
            
        } else {
            cell.textLabel?.text = self.recipes[indexPath.row]
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRecipeDetail" {
            
            let indexPath: NSIndexPath
            let destViewController = segue.destinationViewController as! RecipeDetailViewController
            
            //when select a search result row
            if self.searchDisplayController!.active {
                indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow!
                destViewController.recipeName = searchResults[indexPath.row]
            } else {
                //when select a normal row
                let indexPath = self.tableView.indexPathForSelectedRow
                let object: NSString = recipes[indexPath!.row] as NSString
                
                destViewController.recipeName = object
                
            }
            
            destViewController.hidesBottomBarWhenPushed = true
        }
    }
    
    func filterContentForSearchText (searchText: String) {
        searchResults = recipes.filter{
            $0.localizedCaseInsensitiveContainsString("\(searchText)")
        
        }
    }
    
    func searchDisplayController(controller: UISearchController, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText (searchString)
        return true
    
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            self.performSegueWithIdentifier("showRecipeDetail", sender: self)
        }
    }

}

