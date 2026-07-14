//
//  EditViewController.swift
//  My Notes
//
//  Created by Mohd Badar on 14/07/26.
//

import UIKit

class EditViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    
           textView.delegate = self
           textView.text = "Write here..."
           textView.textColor = UIColor.lightGray
        
        textView.layer.cornerRadius = 10
        textView.clipsToBounds = true
        textView.textContainerInset = UIEdgeInsets(top: 16, left: 12, bottom: 16, right: 12)
        textView.backgroundColor = UIColor(hex: "#F2EDE8")
        backView.backgroundColor = UIColor.white
        headerView.backgroundColor = UIColor(hex: "#E8B4A6")
        addBtn.layer.cornerRadius = 10
        addBtn.backgroundColor = UIColor(hex: "#E8B4A6")
        backBtn.backgroundColor = UIColor(hex: "#F2EDE8")

        // Do any additional setup after loading the view.
    }
    
    
    var onSave: ((String) -> Void)?
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Write here..." {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write here..."
            textView.textColor = .lightGray
        }
    }
    
    
    
    @IBAction func addBtn(_ sender: Any) {
        
        let text = textView.text ?? ""
           
           if text == "Write here..." || text.isEmpty {
               return
           }
           
           onSave?(text)
           
           dismiss(animated: true)
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
