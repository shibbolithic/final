//
//  InviteCoachCollectionViewCell.swift
//  final
//
//  Created by admin65 on 13/11/24.
//

import UIKit

class InviteCoachCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var coachProfileImageView: UIImageView!
    
    @IBOutlet weak var coachProfilenameLabel: UILabel!
    
    func configure(with coach: Coach) {
        coachProfilenameLabel.text = coach.name
        coachProfileImageView.image = UIImage(named: coach.profileImage) // Assuming the profile image is a local asset name
        coachProfileImageView.layer.cornerRadius = coachProfileImageView.frame.size.width / 2
        coachProfileImageView.clipsToBounds = true
        }
}
