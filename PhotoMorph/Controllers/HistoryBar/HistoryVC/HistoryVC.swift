//
//  HistoryVC.swift
//  PhotoMorph
//
//  Created by Alina on 14.06.22.
//

import UIKit

class HistoryVC: UIViewController {

    var historyImages = [SavedImage]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let nibCell = UINib(nibName: String(describing: HistoryCell.self), bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: String(describing: HistoryCell.self))
        tableView.reloadData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        historyImages = RealmManager.read()
        tableView.reloadData()
    }
}



extension HistoryVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        historyImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HistoryCell.self), for: indexPath) as! HistoryCell
        cell.savedImage = historyImages[indexPath.row]
        return cell
    }
    
    
    
}
