//
//  AnnouncementCollectionViewCell.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 21/09/21.
//

import UIKit

class AnnouncementCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "feedAnnouncements"
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let coomentview = ShowAnnouncemetViewController()
    
    weak var viewControlle: UIViewController?
    lazy var loggedInView: ShowAnnouncemetViewController = storyboard.instantiateViewController(withIdentifier: "ShowAnnouncemetViewController") as! ShowAnnouncemetViewController
    
    var announcement: Announcement? {
        didSet {
             updateView()
        }
    }
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var borde: UILabel!
 
    @IBAction func clickOtherWindow(_ sender: UIStoryboardSegue) {
        print("que onda")
        loggedInView.announcementNew = announcement
        viewControlle?.modalPresentationStyle = .fullScreen
        viewControlle?.present(loggedInView, animated: true, completion: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //self.borde.layer.borderWidth = 4
        
        self.borde.layer.borderWidth = 1.5
        self.borde.layer.cornerRadius = 6
        // Initialization code
    }
    
    func updateView()  {
        guard let announcement = announcement else {return }
       
        self.title.text = announcement.title
        
        //self.borde.layer.borderColor = CGColor(red: 100.0, green: 0, blue: 0, alpha: 0)
        
    }

}
