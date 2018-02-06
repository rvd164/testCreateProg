//
//  TableViewControlerTableViewController.swift
//  MyPrjTableViev
//
//  Created by rvd on 2/6/18.
//  Copyright © 2018 rvd. All rights reserved.
//

import UIKit

class TableViewControlerTableViewController: UITableViewController {

    let animals = ["Птах","Півень","Ящірка","Барс","Тигр","Борсук","Лев","Леопард","Страус","Пес","Вовк"]
    var animalsSectionsTitles = [String]()
    var animalDict = [String: [String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controler.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    func createAnimalDict() {
        animalDict = Dictionary(grouping: animals)  //   (group: animals)  {$0.characters.first!}
        // var animalValues = [String:[String]]()
        for animal in animals {
            let animalKey = String(animal[..<1])       // Cut first symbol
            if   var animalValues = animalDict[animalKey] {
                animalValues.append(animal)
                animalDict[animalKey] = animalValues
            } else {
                animalDict[animalKey] = [animal]
            }
            print(animalKey)
        }
        
      //  var animalDictSort = [String: String]()
      //  animalDictSort         = animalDict.sortedByKey
    //    animalsSectionsTitles = [String](animalDict.sortedByKey)
        //   animalsSectionsTitles = Array(animalsSectionsTitles).sorted{$0.0 < $1.0}
        //   animalsSectionsTitles = animalsSectionsTitles.sortedByKey
    }
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DefaultBidirectionalIndices {
    subscript(at: Int) -> Elements.Index {
        return index(startIndex, offsetBy: at)
    }
}
extension String {
    subscript(r: CountableClosedRange<Int>) -> SubSequence {
        return self[indices[r.lowerBound]...indices[r.upperBound]]
    }
    subscript(r: CountablePartialRangeFrom<Int>) -> SubSequence {
        return self[indices[r.lowerBound]...]
    }
    subscript(r: PartialRangeThrough<Int>) -> SubSequence {
        return self[...indices[r.upperBound]]
    }
    subscript(r: PartialRangeUpTo<Int>) -> SubSequence {
        return self[..<indices[r.upperBound]]
    }
}
extension Dictionary where Value:Comparable {
    var sortedByValue:[(Key,Value)] {return Array(self).sorted{$0.1 < $1.1}}
}
extension Dictionary where Key:Comparable {
    var sortedByKey:[(Key,Value)] {return Array(self).sorted{$0.0 < $1.0}}
}
