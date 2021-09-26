//
//  ShowAnnouncemetViewController.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 22/09/21.
//

import UIKit

class ShowAnnouncemetViewController: UIViewController {
    
    var announcementNew: Announcement?
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var body: UILabel!
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true)
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.titleLabel.text = announcementNew?.title
        self.body.text = announcementNew?.body
    }


}
