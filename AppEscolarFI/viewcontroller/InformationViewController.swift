//
//  InformationViewController.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 02/09/21.
//

import UIKit

class InformationViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let showPdfView = segue.destination as? ShowPDFViewController
    
        if (segue.identifier == "calendarioEscolarsegue"){
            showPdfView?.titleName = "Calendario Escolar"
            showPdfView?.stringUrl = "http://escolar.ingenieria.unam.mx/_adicionales/escolar/Cal2022-1.pdf"
        }
        else if (segue.identifier == "guiaEscolarSegue"){
            showPdfView?.titleName = "Guía Escolar"
            showPdfView?.stringUrl = "http://escolar.ingenieria.unam.mx/_adicionales/escolar/Guia2022-1.pdf"
            
        }
    }
}
