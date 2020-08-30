//
//  DetailViewController.swift
//  assignment4
//
//  Created by Andy Olivares on 4/12/20.
//  Copyright © 2020 Andy Olivares. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var presidentNumberLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    
    var imageStore: ImageStore?

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            
            if let imageView = imageView, let imageStore = imageStore {
                imageStore.downloadImage(with: detail.URLimage, completion: {
                    (image: UIImage?) in
                    imageView.image = image
                })
            }
            
            if let label = nameLabel {
                label.text = detail.name
            }
            if let label = presidentNumberLabel {
                label.text = String(detail.number)
            }
            if let label = termLabel {
                let startDate = detail.startDate
                let endDate = detail.endDate
                label.text = "\(startDate) to \(endDate)"
            }
            if let label = nickNameLabel {
                label.text = detail.nickName
            }
            if let label = partyLabel {
                label.text = detail.politicalParty
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: MCUPresidents? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

