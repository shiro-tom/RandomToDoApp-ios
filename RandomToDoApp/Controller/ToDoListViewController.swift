//
//  ToDoListViewController.swift
//  RandomToDoApp
//
//  Created by 白石友樹 on 2024/07/17.
//

import UIKit

class ToDoListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var randomActivityLabel: UILabel!
    @IBOutlet weak var anotherButton: UIButton!
    @IBOutlet weak var doThisButton: UIButton!
    
    var toDoItems: [ToDoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        anotherButton.isHidden = true
        doThisButton.isHidden = true
    }
    
    @objc func addButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addTaskVC = storyboard.instantiateViewController(withIdentifier: "AddTaskViewController") as! AddTaskViewController
        addTaskVC.delegate = self
        navigationController?.pushViewController(addTaskVC, animated: true)
    }
    
    @IBAction func randomActivityButtonTapped(_ sender: UIButton) {
        suggestRandomActivity()
    }
    
    @IBAction func anotherButtonTapped(_ sender: UIButton) {
        suggestRandomActivity()
    }
    
    @IBAction func doThisButtonTapped(_ sender: UIButton) {
        if let activityTitle = randomActivityLabel.text {
            showAddToDoScreen(with: activityTitle)
        }
    }
    
    func suggestRandomActivity() {
        let randomIndex = Int(arc4random_uniform(UInt32(presetActivities.count)))
        let randomActivity = presetActivities[randomIndex]
        randomActivityLabel.text = randomActivity.title
        anotherButton.isHidden = false
        doThisButton.isHidden = false
    }
    
    func showAddToDoScreen(with title: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addTaskVC = storyboard.instantiateViewController(withIdentifier: "AddTaskViewController") as! AddTaskViewController
        addTaskVC.initialTitle = title
        addTaskVC.delegate = self
        navigationController?.pushViewController(addTaskVC, animated: true)
    }
}

extension ToDoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        let toDoItem = toDoItems[indexPath.row]
        cell.textLabel?.text = toDoItem.title
        cell.detailTextLabel?.text = DateFormatter.localizedString(from: toDoItem.date, dateStyle: .short, timeStyle: .short)
        return cell
    }
}

extension ToDoListViewController: AddTaskViewControllerDelegate {
    func didAddTask(_ task: ToDoItem) {
        toDoItems.append(task)
        tableView.reloadData()
    }
}

