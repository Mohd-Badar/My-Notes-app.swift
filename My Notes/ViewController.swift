//
//  ViewController.swift
//  My Notes
//
//  Created by Mohd Badar on 13/07/26.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        cell.titleLabel.text = notes[indexPath.row]
        cell.discriptionLabel.text = notesDetail[indexPath.row]
          
          return cell
    }
    
    var notes = [""]
    var notesDetail = [""]

    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var headerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backView.backgroundColor = UIColor(hex: "#F6EDE8")
        headerView.backgroundColor = UIColor(hex: "#E8B4A6")
        addBtn.backgroundColor = UIColor(hex: "#DFA69A")
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }

    @IBAction func addBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "EditViewController") as! EditViewController
        
        vc.onSave = { [weak self] newNote in
            self?.notes.append(newNote)
            self?.notesDetail.append("New note added")
            self?.tableView.reloadData()
        }
        
        vc.modalPresentationStyle = .fullScreen
         present(vc, animated: true)
    }
    
}



