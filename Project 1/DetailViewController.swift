//
//  DetailViewController.swift
//  Project 1
//
//  Created by Keertiraj Laxman Malik on 11/01/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var imageNumber: Int?
    var totalNumberOfImage: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Picture \(imageNumber!) of \(totalNumberOfImage!)"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        navigationItem.largeTitleDisplayMode = .never
        // Do any additional setup after loading the view.
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped(){
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, selectedImage!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
