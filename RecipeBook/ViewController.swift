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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        recipes = ["Egg Benedict", "Mushroom Risotto", "Full Breakfast", "Hamburger", "Ham and Egg Sandwich", "Creme Brelee", "White Chocolate Donut", "Starbucks Coffee", "Vegetable Curry", "Instant Noodle with Egg", "Noodle with BBQ Pork", "Japanese Noodle with Pork", "Green Tea", "Thai Shrimp Cake", "Angry Birds Cake", "Ham and Cheese Panini", ""]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "RecipeCell"
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(identifier)! as UITableViewCell
        cell.textLabel?.text = self.recipes[indexPath.row]
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRecipeDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let object: NSString = recipes[indexPath.row] as NSString
                
                (segue.destinationViewController as! RecipeDetailViewController).recipeName = object
                
            }
        }
    }

}

