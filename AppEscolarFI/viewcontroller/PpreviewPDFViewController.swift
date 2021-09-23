//
//  PpreviewPDFViewController.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 18/08/21.
//

import UIKit
import PDFKit

class PpreviewPDFViewController: UIViewController,PDFViewDelegate {
    var materia: String?
    public var documentData: Data?
    var schoolsubjectsDone: [SchoolSubject]?
    var i: Int = 0
    
    @IBOutlet weak var pdfViewHere: UIView!
    @IBAction func shareDocument(_ sender: Any) {
        let pdfCreator = PDFCreator(documentName: "COMPROBANTE UNIFICADO DE ESTUDIOS E INSCRIPCIÓN", studentInformation: getStudentInformatio(nombre: "DANIEL CARRILLO MI AMOR", cuenta: "A1111A", carrera: "INGENIERÍA EN COMPUTACIÓN", ciclo: "2021-1",proximoSemestre: "30 DE AGOSTO DE 2021" ), tableTitle: "  CLAVE       NOMBRE DE LA ASIGNATURA                                                   GRUPO")
        let pdfData = pdfCreator.createConstancy(array: schoolsubjectsDone!)
        let vc = UIActivityViewController(activityItems: [pdfData],applicationActivities: nil)
        present(vc, animated: true, completion: nil)
        vc.isModalInPresentation = true
    }
    
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    let pdfView = PDFView()
    
    override func viewDidLoad(){
        print("count: \(String(describing: schoolsubjectsDone?.count))")
        if(schoolsubjectsDone?.count == 0 || schoolsubjectsDone == nil){
           
                showAlert()
            
            
        }else{
            createPDF()
            super.viewDidLoad()
            print("PpreviewPDFViewController")
        }
        


    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pdfView.frame = view.bounds
    }
    
    func createPDF(){
        pdfView.delegate = self
        let pdfCreator = PDFCreator(documentName: "COMPROBANTE UNIFICADO DE ESTUDIOS E INSCRIPCIÓN", studentInformation: getStudentInformatio(nombre: "DANIEL CARRILLO MI AMOR", cuenta: "A1111A", carrera: "INGENIERÍA EN COMPUTACIÓN", ciclo: "2021-1",proximoSemestre: "30 DE AGOSTO DE 2021" ), tableTitle: "  CLAVE       NOMBRE DE LA ASIGNATURA                                                   GRUPO")
        
        
        let newDocument = PDFDocument(data: pdfCreator.createConstancy(array: schoolsubjectsDone!))
        pdfView.document = newDocument
        pdfView.autoScales = true
        
        pdfViewHere.autoresizesSubviews = true
        pdfViewHere.insertSubview(pdfView, at: 1)
        
        
    }
    
    func getStudentInformatio(nombre: String, cuenta: String, carrera: String, ciclo: String,proximoSemestre: String ) -> String{
        return "El alumno: \(nombre)\nCon número de cuenta: \(cuenta)\nRegistrado en la carrera: \(carrera)\nSe encuentra actualmente inscrito en el semestre: \(ciclo)\nInicio del próximo semetre: \(proximoSemestre)\nCursa actualmente las siguientes materias:"
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "", message: "Comentario vacío", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .cancel, handler: {_ in
            self.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true)
    }



}
