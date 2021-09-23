//
//  DownloadDocumentViewController.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 18/08/21.
//

import UIKit
import PDFKit

class DownloadDocumentViewController: UIViewController {

    let pdfView = PDFView()
    let viewSchooSubjectsService = ViewSchooSubjectsService()
    var schoolsubjects: [SchoolSubject]?
    var delegate: CreateScoolSubjects?

    @IBOutlet weak var labelInfo: UILabel!
    
  
    @IBOutlet weak var certificado: UIButton!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("este es el de descargar")
        loadSchoolSubjects()
        print("ola \(String(describing: schoolsubjects?.count))")
        //print("lola\(String(describing: delegate?.didCreateScoolSubjects))")
        self.labelInfo.layer.cornerRadius = 10
        certificado.layer.borderWidth = 1
        certificado.layer.cornerRadius = 4
        certificado.layer.borderColor = CGColor(red: 0, green: 0, blue: 300.0/255.0, alpha: 1.0)
        

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (schoolsubjects?.count == 0 || schoolsubjects == nil){
            errorAlert()
            
        }
        else{
            if (segue.identifier == "pdfPreviewConstancy"){
            //print("que pasa:\(String(describing: schoolsubjects!.count))")
            let preview = segue.destination as? PpreviewPDFViewController
            preview?.schoolsubjectsDone = self.schoolsubjects
            
        }
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pdfView.frame = view.bounds
        
    }
    func loadSchoolSubjects() {
        viewSchooSubjectsService.load { [unowned self] schoolsubjects in self.schoolsubjects = schoolsubjects
            print("hola \(schoolsubjects.count)")
        }
        //print("dani mi amor:\(schoolsubjects?.count)")
    }
    func errorAlert() {
        
        let alert = UIAlertController(title: "", message: "esta vacio", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}


protocol CreateScoolSubjects {
    func didCreateScoolSubjects(schoolSubject: [SchoolSubject]?)
}

