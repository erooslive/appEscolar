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
    let viewStudentService = ViewStudentService()
    
    var schoolsubjects: [SchoolSubject]?
    var student: Student?
    var delegate: CreateScoolSubjects?

    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var certificado: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadConfiguration()
        loadSchoolSubjects()
        loadSchoolStudent()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (schoolsubjects?.count == 0 || schoolsubjects == nil){
            errorAlert()
            
        }
        else{
            if (segue.identifier == "pdfPreviewConstancy"){
                let preview = segue.destination as? PpreviewPDFViewController
                preview?.schoolsubjectsDone = self.schoolsubjects
                preview?.studentHere = self.student
            }
            else if (segue.identifier == "secondpdfview"){
                let second = segue.destination as? SecondPreviewViewController
                second?.studentHere = self.student
            }
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pdfView.frame = view.bounds
        
    }
    func loadConfiguration(){
        self.labelInfo.layer.cornerRadius = 10
        certificado.layer.borderWidth = 1
        certificado.layer.cornerRadius = 4
        certificado.layer.borderColor = CGColor(red: 0, green: 0, blue: 300.0/255.0, alpha: 1.0)
        
        
    }
    func loadSchoolSubjects() {
        viewSchooSubjectsService.load { [unowned self] schoolsubjects in self.schoolsubjects = schoolsubjects
        }
    }
    func loadSchoolStudent() {
        viewStudentService.load { [unowned self] student in self.student = student
           
        }
    }
    func errorAlert() {
        
        let alert = UIAlertController(title: "No cuentas con materias registradas", message: "En caso de requerir asesorìa, puedes acudir a ventanillias de servicios escolares", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}


protocol CreateScoolSubjects {
    func didCreateScoolSubjects(schoolSubject: [SchoolSubject]?)
}

