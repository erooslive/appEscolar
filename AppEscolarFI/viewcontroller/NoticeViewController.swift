//
//  NoticeViewController.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 03/08/21.
//

import UIKit

class NoticeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    let viewAnnouncementService = ViewAnnouncementService()
    
    var announcements: [Announcement]?{
        didSet {
            self.collectioView.reloadData()
        }
    }
    
    @IBOutlet weak var collectioView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loasdConfiguration()
        loadAnnouncements()

    }
    func loasdConfiguration(){
        collectioView.delegate = self
        collectioView.dataSource = self
        collectioView.prefetchDataSource = self
        let nib = UINib(nibName: String(describing: AnnouncementCollectionViewCell.self), bundle: nil)
        collectioView.register(nib, forCellWithReuseIdentifier: "feedAnnouncements")
    }
    
    func loadAnnouncements() {
        viewAnnouncementService.load { [unowned self] announcements in self.announcements = announcements }
    }
    
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
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


