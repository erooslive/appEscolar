//
//  SecondPreviewViewController.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 19/09/21.
//

import UIKit
import PDFKit

class SecondPreviewViewController: UIViewController,PDFViewDelegate {

    let pdfView = PDFView()
    var materia: String?
    var documentData: Data?
    var name: String?
    var studentHere: Student?
   
    
    @IBOutlet weak var pdfViewHere: UIView!
    @IBAction func shareDocument(_ sender: Any) {
        let pdfCreator = PDFCreator(documentName: "COMPROBANTE UNIFICADO DE ESTUDIOS E INSCRIPCIÓN", studentConstancia: studentHere!)
        let pdfData = pdfCreator.createConstancySemester()
        let vc = UIActivityViewController(activityItems: [pdfData],applicationActivities: nil)
        present(vc, animated: true, completion: nil)
        vc.isModalInPresentation = true
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad(){
        createPDF()
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pdfView.frame = pdfViewHere.bounds
    }
    
    func createPDF(){
        pdfView.delegate = self
        let pdfCreator = PDFCreator(documentName: "COMPROBANTE UNIFICADO DE ESTUDIOS E INSCRIPCIÓN", studentConstancia: studentHere!)
        let newDocument = PDFDocument(data: pdfCreator.createConstancySemester())
        pdfView.document = newDocument
        pdfView.autoScales = true
        pdfViewHere.autoresizesSubviews = true
        pdfViewHere.insertSubview(pdfView, at: 1)
        
    }
        
}



