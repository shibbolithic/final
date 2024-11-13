//
//  InviteCoachViewController.swift
//  final
//
//  Created by admin65 on 13/11/24.
//

import UIKit

class InviteCoachViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate, InviteCoachTableViewCellDelegate {
    
    let mockCoaches: [Coach] = [
        Coach(
            uid: UUID(),
            username: "coach3",
            name: "Michael hemming",
            height: 6.0,
            weight: 200.0,
            yearsOfExperience: 10,
            profileImage: "image5",
            region: "Asia",
            teamsCoached: [],
            playersCoached: [],
            achievements: ["Coach of the Year 2021", "Championship Winner 2020"]
        ),
        Coach(
            uid: UUID(),
            username: "coach4",
            name: "Laura langton",
            height: 5.7,
            weight: 150.0,
            yearsOfExperience: 8,
            profileImage: "image6",
            region: "South America",
            teamsCoached: [],
            playersCoached: [],
            achievements: ["Silver Medalist 2019"]
        )
    ]
    var filteredCoaches: [Coach] = [] // Array to store filtered results
        var isSearching = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return isSearching ? filteredCoaches.count : mockCoaches.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "CoachCell", for: indexPath) as! InviteCoachTableViewCell
        let coach = isSearching ? filteredCoaches[indexPath.row] : mockCoaches[indexPath.row]
        cell.nameLabel.text = coach.name
        cell.usernameLabel.text = coach.username
        cell.profileImageView.image = UIImage(named: coach.profileImage)
        
        cell.configure(with: coach)
        cell.delegate = self
        
        
        return cell
    }
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        searchBar.delegate = self
        filteredCoaches = mockCoaches
        // Do any additional setup after loading the view.
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
                    // Show all coaches if search bar is empty
                    isSearching = false
                    filteredCoaches = mockCoaches
                } else {
                    // Filter the mockCoaches array based on search text
                    isSearching = true
                    filteredCoaches = mockCoaches.filter { coach in
                        coach.name.lowercased().contains(searchText.lowercased()) ||
                        coach.username.lowercased().contains(searchText.lowercased()) ||
                        coach.region.lowercased().contains(searchText.lowercased())
                    }
                }
                table.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
                searchBar.text = ""
                filteredCoaches = mockCoaches
                table.reloadData()
                searchBar.resignFirstResponder()
    }
    
    func didTapInvite(for coach: Coach, in cell: InviteCoachTableViewCell) {
            // Implement invitation logic here
            // For example, send a network request or show a confirmation message
            print("Invitation sent to \(coach.name)")
            
            cell.inviteButton.setTitle("Invited", for: .normal)

            // Optionally, show an alert confirming the invitation
            let alert = UIAlertController(title: "Invitation Sent", message: "An invitation has been sent to \(coach.name).", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
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
