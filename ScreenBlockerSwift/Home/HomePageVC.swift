//
//  HomePageVC.swift
//  ScreenBlockerSwift
//
//  Created by KC on 2023/10/2.
//

import UIKit

class HomePageVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    let array = ["Test Block UIKit"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension HomePageVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "BlockUIKitVC")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}
