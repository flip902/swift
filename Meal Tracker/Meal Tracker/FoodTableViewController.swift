//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by Phillip Carlino on 2017-10-26.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var meals: [Meal] {
        let firstBreakfeastFood = Food(name: "Eggs", description: "Scrambled with bacon in a frying pan")
        let secondBreakfastFood = Food(name: "Hashbrowns", description: "Cut potatoes fry in oil until golden brown")
        let thirdBreakfastFood = Food(name: "Bacon", description: "Key food in all breakfeast meals")
        let breakfast = Meal(name: "Breakfast", food: [firstBreakfeastFood, secondBreakfastFood, thirdBreakfastFood])
        
        let firstLunchFood = Food(name: "Sandwich", description: "Easy to fix, always delicious.")
        let secondLunchFood = Food(name: "Chips", description: "Put a few in sandwich for inhanced flavor.")
        let thirdLunchFood = Food(name: "Apple", description: "An apple a day keeps the doctor away.")
        let lunch = Meal(name: "Lunch", food: [firstLunchFood, secondLunchFood, thirdLunchFood])
        
        let firstDinnerFood = Food(name: "Steak", description: "Everyone needs some good protein.")
        let secondDinnerFood = Food(name: "Potatoes", description: "Great addition to steak.")
        let thirdDinnerFood = Food(name: "Brocolli", description: "Always finish out the food pyramid.")
        let dinner = Meal(name: "Dinner", food: [firstDinnerFood, secondDinnerFood, thirdDinnerFood])
        
        
        
        
        return [breakfast, lunch, dinner]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals[section].food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)

        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]
        
        cell.textLabel?.text = food.name
        cell.detailTextLabel?.text = food.description

        return cell
    }
 
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }

   
}
