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
        historyImages = RealmManager.read().reversed()
        tableView.reloadData()
    }
}



extension HistoryVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        historyImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HistoryCell.self), for: indexPath) as! HistoryCell
        cell.setupCell(savedImage: historyImages[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let savedPicVC = SavedPicVC(nibName: String(describing: SavedPicVC.self), bundle: nil)
        
        let imageData = historyImages[indexPath.row].imageData
        guard let image = UIImage(data: imageData) else { return }
        savedPicVC.image = image
        present(savedPicVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    internal func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableView.beginUpdates()
            RealmManager.delete(object: self.historyImages[indexPath.row])
            self.historyImages = RealmManager.read()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    
}
