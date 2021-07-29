//
//  ViewController.swift
//  StructWithTableView
//
//  Created by Macbook on 28/07/2021.
//

import UIKit

struct UserModel {
    var fname: String
    var lname: String
    var age: Int
    var image: UIImage?
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    var userArray = [UserModel]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        userArray = [
            UserModel.init(fname: "Krishna", lname: "Khanal", age: 38, image: UIImage(systemName: "heart.fill") ),
            UserModel.init(fname: "Yogesh", lname: "Patel", age: 28, image: UIImage(systemName: "heart.fill") ),
            UserModel.init(fname: "Pratik", lname: "Konda", age: 30, image: UIImage(systemName: "heart.fill") ),
            UserModel.init(fname: "Hemal", lname: "Patel", age: 20, image: UIImage(systemName: "heart.fill") )
      
        ]
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell?.textLabel?.text = userArray[indexPath.row].fname
        cell?.detailTextLabel?.text = userArray[indexPath.row].lname
        cell?.imageView?.image = userArray[indexPath.row].image
        cell?.imageView?.tintColor = .darkGray
        cell?.accessoryType = .detailDisclosureButton
        cell?.selectionStyle = .none
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController
        secondVC?.userModel = userArray[indexPath.row]
        self.navigationController?.pushViewController(secondVC!, animated: true)
        
    }

}

