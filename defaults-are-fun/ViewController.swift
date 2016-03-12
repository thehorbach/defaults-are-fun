//
//  ViewController.swift
//  defaults-are-fun
//
//  Created by Vyacheslav Horbach on 12/03/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var people = [Person]()

    @IBOutlet weak var favLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let colour = NSUserDefaults.standardUserDefaults().valueForKey("colour") as? String {
            favLbl.text = "Favorite Colour: \(colour)"
        } else {
            favLbl.text = "Pick a colour:"
        }
        
        let personA = Person(first: "Slavik", last: "Drochmann")
        let personB = Person(first: "Lady", last: "Gaga")
        let personC = Person(first: "Muffin", last: "Bieber")
        
        people.append(personA)
        people.append(personB)
        people.append(personC)
        
        let peopleData = NSKeyedArchiver.archivedDataWithRootObject(people)
        
        NSUserDefaults.standardUserDefaults().setObject(peopleData, forKey: "people")
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func greenBtn(sender: AnyObject) {
        favLbl.text = "Favorite Colour: Green"
        NSUserDefaults.standardUserDefaults().setObject("Green", forKey: "colour")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    @IBAction func orangeBtn(sender: AnyObject) {
        favLbl.text = "Favorite Colour: Orange"
        NSUserDefaults.standardUserDefaults().setObject("Orange", forKey: "colour")
        
        
        if let loadedPeople = NSUserDefaults.standardUserDefaults().objectForKey("people") as? NSData {
            if let peopleArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadedPeople) as? [Person] {
                for person in peopleArray {
                    print(person.firstName)
                }
            }
        }
        
    }
    
    @IBAction func blueBtn(sender: AnyObject) {
        favLbl.text = "Favorite Colour: Blue"
        NSUserDefaults.standardUserDefaults().setObject("Blue", forKey: "colour")
    }
}

