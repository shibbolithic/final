///
//  ViewController.swift
//  final
//
//  Created by admin65 on 13/11/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    var team = Team(
        uid: UUID(),
        teamName: "",
        moto: "",
        region: "",
        members: [], // Assuming you have a list of Athlete instances
        coach: [],
        wins: 0,
        losses: 0,
        ties: 0,
        performanceHistory: [], // Assuming you have a list of GameLog instances
        analysisReports: [] // Assuming you have a list of TeamAnalysis instances
    )
    var invitedCoaches: [Coach] = []
    
    @IBOutlet weak var teamNameTextField: UITextField!
    @IBOutlet weak var motoTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var coachProfileCollectionView: UICollectionView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        teamNameTextField.delegate = self
        motoTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
                imageView.addGestureRecognizer(tapGesture)
                imageView.isUserInteractionEnabled = true
        
        coachProfileCollectionView.dataSource = self
        coachProfileCollectionView.delegate = self
    }

    // This function updates the `team` instance based on text field input
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == teamNameTextField {
            team.teamName = teamNameTextField.text ?? ""
        } else if textField == motoTextField {
            team.moto = motoTextField.text ?? ""
        }
        print("Updated Team Data: \(team)")
        
    }
    
    @objc func selectImage() {
            // Check if the photo library is available
            guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
            
            // Create and configure the image picker
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true // Allows the user to crop the image
            
            // Present the image picker
            present(imagePicker, animated: true, completion: nil)
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // Get the edited image or the original image
            if let selectedImage = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
                imageView.image = selectedImage // Display the image in the image view
            }
            dismiss(animated: true, completion: nil) // Dismiss the image picker
        }
        
        // Handle cancellation
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
    // MARK: - UICollectionViewDataSource
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return invitedCoaches.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoachImageCell", for: indexPath) as! InviteCoachCollectionViewCell
            let coach = invitedCoaches[indexPath.row]
            cell.configure(with: coach)
            return cell
        }
        
        // MARK: - UICollectionViewDelegateFlowLayout
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 100, height: 120) // Adjust size as needed
        }
        
    func inviteCoach(_ coach: Coach) {
            invitedCoaches.append(coach)
            coachProfileCollectionView.reloadData()
        }

}

