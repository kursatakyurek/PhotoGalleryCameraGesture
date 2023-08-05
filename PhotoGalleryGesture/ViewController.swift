//
//  ViewController.swift
//  PhotoGalleryGesture
//
//  Created by Kürşat Akyürek on 5.08.2023.
//

import UIKit

final class ViewController: UIViewController,UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var imageSelect: UIImageView!
    @IBOutlet weak var cameraSelect: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageSelect.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(openGallery))
        imageSelect.addGestureRecognizer(gestureRecognizer)
        
        cameraSelect.isUserInteractionEnabled = true
        let gestureRecognizerCamera = UITapGestureRecognizer(target: self, action: #selector(openCamera))
        cameraSelect.addGestureRecognizer(gestureRecognizerCamera)
        
    }
    
    @objc func openCamera(){
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @objc func openGallery(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imageSelect.image = image
        cameraSelect.image = image
        picker.dismiss(animated: true)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
}

