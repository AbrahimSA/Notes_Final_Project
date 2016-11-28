//
//  NotesTableViewController.swift
//  Notes_Final_Project
//
//  Created by abrahim abrahao on 2016-11-25.
//  Copyright © 2016 abrahim abrahao. All rights reserved.
//

import UIKit
import CoreData

class NotesTableViewController: UITableViewController, NSFetchedResultsControllerDelegate, UISearchBarDelegate, UISearchDisplayDelegate {
       // var SubjectArray  = ["School", "Work", "Todo","Appointment", "Task", "Doctor","Shopping", "Reminder", "Others"]
    @IBOutlet weak var searchBarNotes: UISearchBar!
    
    @IBOutlet var tableViewNotes: UITableView!
    
    
    var notestList = [NSManagedObject]()
    let managedObjectContext = (UIApplication.shared.delegate  as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        let entityDescription =
            NSEntityDescription.entity(forEntityName: "MyNotes",
                                       in: managedObjectContext)
        
        let request: NSFetchRequest<MyNotes> = MyNotes.fetchRequest()
        request.entity = entityDescription
        
        do {
            let results = try managedObjectContext.fetch(request as! NSFetchRequest<NSFetchRequestResult>)
            
            if results.count > 0 {
                notestList = results as! [NSManagedObject]
                
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
        
    
        tableViewNotes.delegate = self
        tableViewNotes.dataSource = self
        searchBarNotes.delegate = self
        
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
    
        return notestList.count//rowsOfSection(sec: section.description)
    }
    
    // func numberOfSectionsInTableView(tableView: UITableView) -> Int
 //   {
 //       return notestList.count
 //   }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellNotes", for: indexPath)
        cell.textLabel?.text = notestList[indexPath.row].value(forKey: "event_name") as? String
        let dateCell = notestList[indexPath.row].value(forKey: "date_time") as? Date
        cell.detailTextLabel?.text = dateCell?.description //notestList[indexPath.row].value(forKey: "data_time") as? String
        let img: NSData? = notestList[indexPath.row].value(forKey: "photo") as? NSData
        if ((img) != nil) {
            cell.imageView?.image = UIImage(data: img! as Data)
        } else {
            cell.imageView?.image = #imageLiteral(resourceName: "no-image-icon")
        }
        
        return cell
        
        
        //let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as CustomCell
        
        //cell.name.text = table_data[indexPath.section].data[indexPath.row]
        //cell.index.text = String(indexPath.row)

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let saveNotes =  self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            
        saveNotes.nowNotes = [notestList[indexPath.row]]
        self.present(saveNotes, animated: true, completion: nil)
        
        //self.performSegue(withIdentifier: "SegueAdd", sender: indexPath.row)

    }
    

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if editingStyle == .delete {
            let notes = notestList[indexPath.row]
            context.delete(notes)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do {
                notestList = try context.fetch(MyNotes.fetchRequest())
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            catch {
                print("Feching Failed")
            }
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // filter

    /*
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }*/
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        let request: NSFetchRequest<MyNotes> = MyNotes.fetchRequest() //NSFetchRequest<NSFetchRequestResult>(entityName: "MyNotes")
        if (searchText.characters.count > 0 && searchText.characters.isEmpty != true && searchText != " "  ) {
           let predicate = NSPredicate(format: "event_name CONTAINS[c] '" + searchText + "'")
           request.predicate = predicate
        }
        
        do {
            let results = try managedObjectContext.fetch(request as! NSFetchRequest<NSFetchRequestResult>)
            
          //  if results.count > 0 {
                notestList = results as! [NSManagedObject]
                
          //  }
            
        } catch let error {
            print(error.localizedDescription)
            notestList = [NSManagedObject]()
        }
        
        /*
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }*/
        self.tableView.reloadData()
    }
    
    
    // --------------- My Functions
    func msgAlert(msg: String) {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
 
}
