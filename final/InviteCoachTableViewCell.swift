//
//  InviteCoachTableViewCell.swift
//  final
//
//  Created by admin65 on 13/11/24.
//

import UIKit


protocol InviteCoachTableViewCellDelegate: AnyObject {
    func didTapInvite(for coach: Coach, in cell: InviteCoachTableViewCell)
}

class InviteCoachTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var inviteButton: UIButton!
    
    weak var delegate: InviteCoachTableViewCellDelegate?
        var coach: Coach?
    
    func configure(with coach: Coach) {
            self.coach = coach
            nameLabel.text = coach.name
            usernameLabel.text = coach.username
            profileImageView.image = UIImage(named: coach.profileImage)
            inviteButton.setTitle("Invite", for: .normal)

        }
        
        @IBAction func inviteButtonTapped(_ sender: UIButton) {
            guard let coach = coach else { return }
                    delegate?.didTapInvite(for: coach, in: self) // Notify the delegate
        }
}

