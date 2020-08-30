//
//  MasterViewController.swift
//  assignment4
//
//  Created by Andy Olivares on 4/12/20.
//  Copyright © 2020 Andy Olivares. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [MCUPresidents]()
    let imageStore = ImageStore()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = editButtonItem

        //let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        //navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        downloadJSONData()
        //objects.append(MCUPresidents(name:"tomas", realName: "idk", allegiance: "deth"))
    }
    
    func downloadJSONData(){
        guard let url = URL(string: "https://www.prismnet.com/~mcmahon/CS321/presidents.json")
            else{
                showAlert("Invalid URL for JSON data")
                return
        }
        weak var weakSelf = self
        
        let task = URLSession.shared.dataTask(with: url){
            (data, response, error) in
            
            let httpResponse = response as? HTTPURLResponse
            
            if httpResponse!.statusCode != 200{
                weakSelf?.showAlert("HTTP error: status code \(httpResponse!.statusCode)")
            }else if(data == nil && error != nil){
                weakSelf?.showAlert("No data downloaded")
            }else{
                do{
                    weakSelf?.objects = try JSONDecoder().decode([MCUPresidents].self, from: data!)
                    weakSelf?.objects.sort{
                        return $0.name < $1.name
                    }
                }catch{
                    weakSelf?.showAlert("Unable to decode JSON")
                }
                DispatchQueue.main.async {
                    weakSelf?.tableView.reloadData()
                }
            }
        }
        
        
        task.resume()

    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
/*
    @objc
    func insertNewObject(_ sender: Any) {
        objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
*/
    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.imageStore = imageStore
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PresidentCell
        let object = objects[indexPath.row]
        cell.nameLabel!.text = object.name
        cell.politicalLabel!.text = String(object.politicalParty)
        
        imageStore.downloadImage(with: object.URLimage, completion: {
            (image: UIImage?) in
            cell.presidentImage.image = image
        })
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

    func showAlert(_ message: String){
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        weak var weakSelf = self
        DispatchQueue.main.async {
            weakSelf?.present(alertController, animated: true, completion: nil)
        }
    }

}

