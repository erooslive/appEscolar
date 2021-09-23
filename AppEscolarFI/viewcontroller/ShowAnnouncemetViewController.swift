//
//  ShowAnnouncemetViewController.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 22/09/21.
//

import UIKit

class ShowAnnouncemetViewController: UIViewController {
    
    var announcementNew: Announcement?
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.titleLabel.text = announcementNew?.title
        self.body.text = announcementNew?.body

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var body: UILabel!
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true)
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
