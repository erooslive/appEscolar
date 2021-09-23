//
//  ConstancyRequestViewController.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 14/09/21.
//

import UIKit

class ConstancyRequestViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDataSourcePrefetching,UICollectionViewDelegateFlowLayout {
    
    let viewManualSchoolConstancyService = ViewManualSchoolConstancyService()
    let refreshControl = UIRefreshControl()
    let postInputView = SelectConstancyViewController()
    var tipoConstancia = Array(repeating: "Z", count: 1)
    var manualSchoolConstancies: [ManualSchoolConstancy]?{
         didSet {
             self.manualConstancyCollectionView.reloadData()
            self.refreshControl.endRefreshing()
         }
     }
    
    
    @IBOutlet weak var manualConstancyCollectionView: UICollectionView!
    @IBAction func newRequest(_ sender: Any) {
    }

    
    @IBAction func reload(_ sender: Any) {
        loadManualSchoolConstancies()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postInputView.delegate = self
        
        manualConstancyCollectionView.delegate = self
        manualConstancyCollectionView.prefetchDataSource = self
        manualConstancyCollectionView.dataSource = self
        let nib = UINib(nibName: String(describing: ManualSchoolConstancyCollectionViewCell.self), bundle: nil)
        manualConstancyCollectionView.register(nib, forCellWithReuseIdentifier: "manualConstancyCell")
        
        manualConstancyCollectionView.addSubview(refreshControl)

        refreshControl.addTarget(self, action: #selector(self.loadManualSchoolConstancies), for: UIControl.Event.valueChanged)
        loadManualSchoolConstancies()
        print("constancy Request")

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        for constancy in manualSchoolConstancies!{
            tipoConstancia.append(constancy.name)
        }
            if (segue.identifier == "constancyRequest"){
            let selectConstancy = segue.destination as? SelectConstancyViewController
                selectConstancy?.arrayDocument = tipoConstancia
        }
    }
    
    @objc func loadManualSchoolConstancies() {
        viewManualSchoolConstancyService.load { [unowned self] manualSchoolConstancies in self.manualSchoolConstancies = manualSchoolConstancies }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print("dani mi amor:\(manualSchoolConstancies?.count)")
        return manualSchoolConstancies?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = manualConstancyCollectionView.dequeueReusableCell(withReuseIdentifier: "manualConstancyCell", for: indexPath) as! ManualSchoolConstancyCollectionViewCell

        cell.manualSchoolConstancy = self.manualSchoolConstancies?[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        guard let indexPath = indexPaths.last else { return }
        print("================\(indexPath.row)=================")
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: manualConstancyCollectionView.bounds.width, height: 50)
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

extension ConstancyRequestViewController: ManualRecordsDelegate {
    func didCreateManualRecord(manualRecord: ManualSchoolConstancy?) {
        guard let umanualRecord = manualRecord else { return }
        self.manualSchoolConstancies?.insert(umanualRecord, at: 0)
    }
    
}
