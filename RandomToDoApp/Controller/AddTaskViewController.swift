//
//  AddTaskViewController.swift
//  RandomToDoApp
//
//  Created by 白石友樹 on 2024/07/17.
//

import UIKit

protocol AddTaskViewControllerDelegate: AnyObject {
    func didAddTask(_ task: ToDoItem)
}

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var colorButton: UIButton!
    
    weak var delegate: AddTaskViewControllerDelegate?
    var initialTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = initialTitle
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let title = titleTextField.text, !title.isEmpty else { return }
        let date = datePicker.date
        let notes = notesTextView.text
        let color = UIColor.random() // ここでカスタムカラーピッカーを実装するか、デフォルトの色を使用します
        
        let newToDoItem = ToDoItem(title: title, date: date, notes: notes, color: color)
        delegate?.didAddTask(newToDoItem)
        navigationController?.popViewController(animated: true)
    }
}

