//
//  PpreviewPDFViewController.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 18/08/21.
//

import UIKit
import PDFKit

class PpreviewPDFViewController: UIViewController,PDFViewDelegate {
    let pdfView = PDFView()
    
    public var documentData: Data?
    var materia: String?
    var schoolsubjectsDone: [SchoolSubject]?
    var i: Int = 0
    var studentHere: Student?
    
    
    @IBOutlet weak var pdfViewHere: UIView!
    @IBAction func shareDocument(_ sender: Any) {
        let pdfCreator = PDFCreator(documentName: "COMPROBANTE UNIFICADO DE ESTUDIOS E INSCRIPCIÓN", studentConstancia: studentHere!)
        let pdfData = pdfCreator.createConstancy(array: schoolsubjectsDone!)
        let vc = UIActivityViewController(activityItems: [pdfData],applicationActivities: nil)
        present(vc, animated: true, completion: nil)
        vc.isModalInPresentation = true
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad(){
        if(schoolsubjectsDone?.count == 0 || schoolsubjectsDone == nil){
                showAlert()
        }else{
            createPDF()
            super.viewDidLoad()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pdfView.frame = pdfViewHere.bounds
    }
    
    func createPDF(){
        pdfView.delegate = self
        let pdfCreator = PDFCreator(documentName: "COMPROBANTE UNIFICADO DE ESTUDIOS E INSCRIPCIÓN", studentConstancia: studentHere!)
        let newDocument = PDFDocument(data: pdfCreator.createConstancy(array: schoolsubjectsDone!))
        pdfView.document = newDocument
        pdfView.autoScales = true
        pdfViewHere.autoresizesSubviews = true
        pdfViewHere.insertSubview(pdfView, at: 1)
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "error de consulta", message: "Comunicarse con servicios escolares", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .cancel, handler: {_ in
            self.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true)
    }



}
