
//
//  TableViewController.swift
//  StickyHeaders
//
//  Created by Duc Anh on 6/20/19.
//  Copyright © 2019 Duc Anh. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let movie: [String: [String]] = [
        "A": ["Aladdin", "Aliens", "American History X", "Anchorman: The Legend of Ron Burgundy", "A World Without Thieves"],
        "B": ["Basic Instinct", "Batman Begins", "Beauty and The Beast", "The Beach", "Big Trouble in Little China"],
        "C": ["Catch Me If You Can", "Cloudy with a Chance of Meatballs", "The Crow"],
        "D": ["The Departed", "Dredd", "Dr. Strangelove", "Dumb & Dumber"],
        "E": ["Enter The Dragon", "Equilibrium", "Escape from New York", "Event Horizon"],
        "F": ["Fight Club", "Finding Nemo", "First Blood", "Full Metal Jacket"],
        "G": ["Gladiator", "The Godfather", "Good Will Hunting", "Goodfellas", "The Goonies"],
        "H": ["Harry Potter", "Hercules", "Hero", "Horton Hears A Who", "How to Train Your Dragon"],
        "I": ["Ice Age", "Inception", "The Incredibles", "Indiana Jones", "Iron Man"],
        "J": ["Jaws", "Jumanji", "Jurassic Park"],
        "K": ["Kill Bill", "King Kong", "Knocked Up", "Kung Fu Hustle"],
        "L": ["The Land Before Time", "The Lego Movie", "The Lord of the Rings", "Lost in Space"],
        "M": ["The Mask", "The Matrix", "Men in Black", "Minority Report", "Mission Impossible", "Monsters, Inc."],
        "N": ["Napoleon Dynamite", "National Treasure", "Night of the Museum"],
        "O": ["Office Space", "Old Boy", "Old School", "Over the Hedge"],
        "P": ["The Pacifier", "Pan's Labyrinth", "Pinocchio", "Pride & Prejudice", "Public Enemies"],
        "Q": ["Quarantine", "Quick Gun Murugun", "A Quiet Little Marriage"],
        "R": ["Ratatouille", "Red Eye", "Resident Evil", "Rocky", "Rush Hour"],
        "S": ["Schindler's List", "Se7en", "The Shawshank Redemption", "Sherlock Holmes", "Shrek", "Silent Hill", "Sin City"],
        "T": ["Terminator", "Texas Chainsaw Massacre", "Titanic", "Toy Story", "Transformers", "The Truman Show"],
        "U": ["Undercover Brother", "Underworld", "Up In the Air"],
        "V": ["V for Vendetta", "Vanilla Sky", "Venus Boyz"],
        "W": ["Wall-E", "Wanted", "The Wild", "Willy Wonka and the Chocolate Factory", "The Wizard of Oz"],
        "X": ["The X-Files: Fight the Future", "X-Men", "xXx"],
        "Y": ["You Got Served", "You've Got Mail", "You Only Live Twice", "Young Frankenstein"],
        "Z": ["Zombieland", "Zookeeper", "Zoolander", "Zorro"]
    ]
    
    var movieKey: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieKey = movie.keys.sorted()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension TableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return movieKey.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let rows = movie[movieKey[section]]?.count {
            return rows
        }
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        if let array = movie[movieKey[indexPath.section]] {
            cell.textLabel?.text = array[indexPath.row]
        } else {
            cell.textLabel?.text = ""
        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return movieKey[section]
    }
}
