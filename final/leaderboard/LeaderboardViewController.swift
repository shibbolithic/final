//
//  LeaderboardViewController.swift
//  final
//
//  Created by admin65 on 14/11/24.
//

import UIKit

class LeaderboardViewController: UIViewController {

    @IBOutlet weak var leaderboardSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var top3ContainerView: UICollectionView!
    
    @IBOutlet weak var top10TableView: UITableView!
    
    @IBOutlet weak var top10containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
