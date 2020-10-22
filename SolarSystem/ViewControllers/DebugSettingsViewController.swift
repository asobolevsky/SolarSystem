//
//  DebugSettingsViewController.swift
//  SolarSystem
//
//  Created by Aleksei Sobolevskii on 2020-10-22.
//

import UIKit

class DebugSettingsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var optionsTable: UITableView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionsTable.dataSource = self
        optionsTable.delegate = self
    }
    
}


// MARK: - UITableViewDataSource

extension DebugSettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        return cell
    }
    
}


// MARK: - UITableViewDelegate

extension DebugSettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
