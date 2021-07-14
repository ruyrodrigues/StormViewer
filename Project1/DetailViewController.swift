//
//  DetailViewController.swift
//  Project1
//
//  Created by user on 06/07/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var totalImages = ViewController().pictures.count
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let pictureName = selectedImage else { return }
        title = "This image is the \(pictureName)"
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}
