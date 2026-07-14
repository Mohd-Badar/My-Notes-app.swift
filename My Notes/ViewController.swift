//
//  ViewController.swift
//  My Notes
//
//  Created by Mohd Badar on 13/07/26.
//

import UIKit

struct Note {
    var title: String
    var detail: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(identifier: "EditViewController") as! EditViewController
        
        vc.editTitle = notes[indexPath.row]
        vc.editDetail = notesDetail[indexPath.row]
        
        vc.noteIndex = indexPath.row
        
        vc.onUpdate = { [weak self] title, detail, index in
            self?.notes[index] = title
            self?.notesDetail[index] = detail
                        UserDefaults.standard.set(self?.notes, forKey: "notes")
            UserDefaults.standard.set(self?.notesDetail, forKey: "notesDetail")
            
            self?.tableView.reloadData()
        }
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        cell.titleLabel.text = notes[indexPath.row]

        cell.titleLabel.numberOfLines = 1
        cell.titleLabel.lineBreakMode = .byWordWrapping

        let fullText = notesDetail[indexPath.row]
        let words = fullText.split(separator: " ")
        let shortText = words.prefix(3).joined(separator: " ")

        cell.discriptionLabel.text = words.count > 3 ? shortText + "..." : shortText
        cell.discriptionLabel.numberOfLines = 1

        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            notes.remove(at: indexPath.row)
            notesDetail.remove(at: indexPath.row)
            
            UserDefaults.standard.set(notes, forKey: "notes")
            UserDefaults.standard.set(notesDetail, forKey: "notesDetail")
           
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    var notes: [String] = []
    var notesDetail: [String] = []

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
        
        if let savedNotes = UserDefaults.standard.stringArray(forKey: "notes"),
        let savedDetails = UserDefaults.standard.stringArray(forKey: "notesDetail") {
            
            notes = savedNotes
            notesDetail = savedDetails
        }
        
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }

    @IBAction func addBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "EditViewController") as! EditViewController
          
          vc.onSave = { [weak self] title, detail in
              self?.notes.append(title)
              self?.notesDetail.append(detail)
              UserDefaults.standard.set(self?.notes, forKey: "notes")
              UserDefaults.standard.set(self?.notesDetail, forKey: "notesDetail")
              self?.tableView.reloadData()
          }
          
          vc.modalPresentationStyle = .fullScreen
          present(vc, animated: true)
    }
    
}



