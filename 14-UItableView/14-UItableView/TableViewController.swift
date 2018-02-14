//
//  TableViewController.swift
//  14-UItableView
//
//  Created by rvd on 2/9/18.
//  Copyright © 2018 rvd. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var dataArray:[String] = []
    func saveData() {
        UserDefaults.standard.set(dataArray, forKey: "dataArray")   // StandardUserDefaults().s      //setObject(dataArray, forkey: "dataArray") //    (dataArray,forKey: "dataArray")
        UserDefaults.standard.synchronize()
    }
    
    func loadData() {
        let data = UserDefaults.standard.object(forKey: "dataArray")
        if data != nil {
            dataArray = data as! [String]
        } else {
            dataArray = []
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
      //  dataArray.append("Літак")
      //  dataArray.append("Машина")
      //  dataArray.append("Велосипед")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    @IBAction func pushEditAction(_ sender: Any) {
   // tableView.isEditing = true
        tableView.setEditing(!tableView.isEditing, animated: true)
    
    }
    
    

    @IBAction func pushAddAction(_ sender: Any) {
  // dataArray.append("New element")
        let alert = UIAlertController(title: "Вид транспорту ", message: "Додати новий", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            (action: UIAlertAction!) -> Void in
            let textField = alert.textFields![0]
            self.dataArray.append(textField.text!)
        self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) {
        (action: UIAlertAction!) -> Void in
            
        }
        
        alert.addTextField {(textField: UITextField) -> Void in
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
        tableView.reloadData()
        saveData()
    
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
       let currentTextInCell =  dataArray[indexPath.row]
        cell.textLabel?.text = currentTextInCell
        // Configure the cell...

        return cell
    }
 
    
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            dataArray.remove(at: indexPath.row)
            
            saveData()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
          let from = dataArray[fromIndexPath.row]
         dataArray.remove(at: fromIndexPath.row)
        dataArray.insert(from, at: to.row) //(from, at: IndexPath)
        saveData()
        tableView.reloadData()
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
   
        let selectedData = dataArray[(tableView.indexPathForSelectedRow?.row)!]
        (segue.destination as! NewViewController).textData = selectedData
    }
    

}
