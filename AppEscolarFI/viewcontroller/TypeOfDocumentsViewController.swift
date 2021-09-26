//
//  TypeOfDocumentsViewController.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 24/09/21.
//

import UIKit

class TypeOfDocumentsViewController: UIViewController {
    
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
        let scrollview = UIScrollView(frame: CGRect(x: 10, y: 140, width: view.frame.size.width - 20, height: view.frame.size.height - 180))
       
        view.addSubview(scrollview)
        
        let labeltituloInscripcion = UILabel(frame: CGRect(x: 10, y: 10, width: view.frame.size.width - 40 , height: 30))
        labeltituloInscripcion.textAlignment = .left
        labeltituloInscripcion.numberOfLines = 1
        labeltituloInscripcion.font = UIFont(name: "Times New Roman", size: 23)
        labeltituloInscripcion.text = "*De Descarga Directa:"
        scrollview.addSubview(labeltituloInscripcion)
        
        let labelBodyComprobante = UILabel(frame: CGRect(x: 10, y: 50, width: view.frame.size.width - 40 , height: 120))
        labelBodyComprobante.textAlignment = .justified
        labelBodyComprobante.numberOfLines = 6
        labelBodyComprobante.font = UIFont(name: "Times New Roman", size: 18)
        labelBodyComprobante.text = "-Comprobante unificado de estudios e inscripción: Constancia que indica que actualmente te encuentras inscrito a mínimo 1 materia, señala nombre de materia, grupo y clave. Solicitada para cumplir requisitos de algunas becas o en trabajos."
        scrollview.addSubview(labelBodyComprobante)
        
        let labelBodyContanciaEstudios = UILabel(frame: CGRect(x: 10, y: 180, width: view.frame.size.width - 40 , height: 140))
        labelBodyContanciaEstudios.textAlignment = .justified
        labelBodyContanciaEstudios.numberOfLines = 7
        labelBodyContanciaEstudios.font = UIFont(name: "Times New Roman", size: 18)
        labelBodyContanciaEstudios.text = "-Costancia de estudios y semestre inscrito: Constancia que indica que actualmente te encuentras inscrito a mínimo 1 materia de manera ordinara, indica tu nombre, carreara y a que semestre te encuentras inscrito. Solicitada para cumplir requisitos de algunas becas o en trabajos."
        scrollview.addSubview(labelBodyContanciaEstudios)
        
        let labeltituloManual = UILabel(frame: CGRect(x: 10, y: 340, width: view.frame.size.width - 40 , height: 30))
        labeltituloManual.textAlignment = .left
        labeltituloManual.numberOfLines = 1
        
        labeltituloManual.font = UIFont(name: "Times New Roman", size: 23)
        labeltituloManual.text = "*Por solicitud a Plantel vía aplicación:"
        scrollview.addSubview(labeltituloManual)
        
        let labelBodyCertificado = UILabel(frame: CGRect(x: 10, y: 380, width: view.frame.size.width - 40 , height: 160))
        labelBodyCertificado.textAlignment = .justified
        labelBodyCertificado.numberOfLines = 8
        labelBodyCertificado.font = UIFont(name: "Times New Roman", size: 18)
        labelBodyCertificado.text = "-Certificado de estudios: Inndica si has terminado con tus estudios de acuerdo al plan de estudios de tu carrera, se listan todas las materias que cursaste con calificación, lleva sello en relieve y firmas de funcionarios. Solicitada para revalidación de estudios en otras instituciones, para estudios de posgrado y para cuestiones laborales."
        scrollview.addSubview(labelBodyCertificado)
        
        let labelBodyConstanciaTermino = UILabel(frame: CGRect(x: 10, y: 540, width: view.frame.size.width - 40 , height: 120))
        labelBodyConstanciaTermino.textAlignment = .justified
        labelBodyConstanciaTermino.numberOfLines = 6
        labelBodyConstanciaTermino.font = UIFont(name: "Times New Roman", size: 18)
        labelBodyConstanciaTermino.text = "-Constancia de Termino de estudios: Indica que has terminado tu carrera de acuerdo plan de estudios, incluye el promedio general y el tiempo en que terminaste la carrera. Solicitada para cuestiones laborales."
        scrollview.addSubview(labelBodyConstanciaTermino)
        
        let labelBodyConstanciaCreditos = UILabel(frame: CGRect(x: 10, y: 670, width: view.frame.size.width - 40 , height: 120))
        labelBodyConstanciaCreditos.textAlignment = .justified
        labelBodyConstanciaCreditos.numberOfLines = 6
        labelBodyConstanciaCreditos.font = UIFont(name: "Times New Roman", size: 18)
        labelBodyConstanciaCreditos.text = "-Constancia de créditos: Indica el avance en tu plan de estudios. Incluye nùmero de créditos y el porcentaje equivalente al avance en tu plan de estudios. Solicitada para servicio social o en situacionas laborales."
        scrollview.addSubview(labelBodyConstanciaCreditos)
        
        let labeltituloFisicamente = UILabel(frame: CGRect(x: 10, y: 810, width: view.frame.size.width - 40 , height: 30))
        labeltituloFisicamente.textAlignment = .left
        labeltituloFisicamente.numberOfLines = 1
        labeltituloFisicamente.font = UIFont(name: "Times New Roman", size: 23)
        labeltituloFisicamente.text = "*Solicitud física en plantel:"
        scrollview.addSubview(labeltituloFisicamente)
        
        let labelBodyCredencial = UILabel(frame: CGRect(x: 10, y: 840, width: view.frame.size.width - 40 , height: 100))
        labelBodyCredencial.textAlignment = .justified
        labelBodyCredencial.numberOfLines = 5
        labelBodyCredencial.font = UIFont(name: "Times New Roman", size: 18)
        labelBodyCredencial.text = "-Reposición de Credencial: En caso de extravío o robo, puedes acudir a ventanillas de la Facultad para solicitar reposición, es necesario verificar tu identidad físicamente para realizar la solicitud"
        scrollview.addSubview(labelBodyCredencial)
        
        scrollview.contentSize = CGSize(width: view.frame.size.width - 20, height: 1230)
        }


}
