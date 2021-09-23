//
//  SecondPreviewViewController.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 19/09/21.
//

import UIKit
import PDFKit

class SecondPreviewViewController: UIViewController,PDFViewDelegate {

    var materia: String?
    public var documentData: Data?
   
    
    @IBOutlet weak var pdfViewHere: UIView!
    @IBAction func shareDocument(_ sender: Any) {
        let pdfCreator = PDFCreator(documentName: "COMPROBANTE UNIFICADO DE ESTUDIOS E INSCRIPCIÓN", studentInformation: getStudentInformatio(nombre: "DANIEL CARRILLO MI AMOR", cuenta: "A1111A", carrera: "INGENIERÍA EN COMPUTACIÓN", ciclo: "2021-1",proximoSemestre: "30 DE AGOSTO DE 2021" ), tableTitle: "  CLAVE       NOMBRE DE LA ASIGNATURA                                                   GRUPO")
        let pdfData = pdfCreator.createConstancySemester()
        let vc = UIActivityViewController(activityItems: [pdfData],applicationActivities: nil)
        present(vc, animated: true, completion: nil)
        vc.isModalInPresentation = true
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    let pdfView = PDFView()
    
    
    
    override func viewDidLoad(){
    
        createPDF()
        super.viewDidLoad()
        print("SecondPreviewViewController")
       


    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pdfView.frame = view.bounds
    }
    
    func createPDF(){
        pdfView.delegate = self
        let pdfCreator = PDFCreator(documentName: "CONSTANCIA DE ESTUDIOS Y SEMESTRES INSCRITOS.", studentInformation: getStudentInformatio(nombre: "DANIEL CARRILLO MI AMOR", cuenta: "A1111A", carrera: "INGENIERÍA EN COMPUTACIÓN", ciclo: "2021-1",proximoSemestre: "30 DE AGOSTO DE 2021" ), tableTitle: "  CLAVE       NOMBRE DE LA ASIGNATURA                                                   GRUPO")
        
        
        let newDocument = PDFDocument(data: pdfCreator.createConstancySemester())
        pdfView.document = newDocument
        pdfView.autoScales = true
        
        pdfViewHere.autoresizesSubviews = true
        pdfViewHere.insertSubview(pdfView, at: 1)
        
        
    }
    
    func getStudentInformatio(nombre: String, cuenta: String, carrera: String, ciclo: String,proximoSemestre: String ) -> String{
        return "El alumno: \(nombre)\nCon número de cuenta: \(cuenta)\nRegistrado en la carrera: \(carrera)\nSe encuentra actualmente inscrito en el semestre: \(ciclo)\nInicio del próximo semetre: \(proximoSemestre)\nCursa actualmente las siguientes materias:"
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
