//
//  NoticeViewController.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 03/08/21.
//

import UIKit

class NoticeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate, UNUserNotificationCenterDelegate,UICollectionViewDelegateFlowLayout{

    let viewAnnouncementService = ViewAnnouncementService()
   
    
   var announcements: [Announcement]?{
        didSet {
            self.collectioView.reloadData()
        }
    }
    
    @IBOutlet weak var collectioView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectioView.delegate = self
        collectioView.dataSource = self
        collectioView.prefetchDataSource = self
        let nib = UINib(nibName: String(describing: AnnouncementCollectionViewCell.self), bundle: nil)
        collectioView.register(nib, forCellWithReuseIdentifier: "feedAnnouncements")
        loadAnnouncements()
        print("NoticeViewController")

        // Do any additional setup after loading the view.
    }
    
    func loadAnnouncements() {
        viewAnnouncementService.load { [unowned self] announcements in self.announcements = announcements }
        
    }
    
    func cluodMessaging(){
        if #available(iOS 10.0, *) {
          // For iOS 10 display notification (sent via APNS)
          UNUserNotificationCenter.current().delegate = self

          let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
          UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in }
          )
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print("dani mi amor:\(schoolsubjects?.count)")
        return announcements?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectioView.dequeueReusableCell(withReuseIdentifier: "feedAnnouncements", for: indexPath) as! AnnouncementCollectionViewCell
        cell.viewControlle = self
        cell.announcement = self.announcements?[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 150)
    }
    
}
extension NoticeViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        guard let indexPath = indexPaths.last else { return }
        print("================\(indexPath.row)=================")
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate{
    
}

