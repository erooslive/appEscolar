//
//  TramitesViewController.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 24/09/21.
//

import UIKit

class TramitesViewController: UIViewController {
    
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
        let scrollview = UIScrollView(frame: CGRect(x: 10, y: 140, width: view.frame.size.width - 20, height: view.frame.size.height - 180))
       
        view.addSubview(scrollview)
        
        let labeltituloInscripcion = UILabel(frame: CGRect(x: 10, y: 10, width: view.frame.size.width - 40 , height: 30))
        labeltituloInscripcion.textAlignment = .left
        labeltituloInscripcion.numberOfLines = 1
        labeltituloInscripcion.font = UIFont(name: "Times New Roman", size: 23)
        labeltituloInscripcion.text = "*Reinscripción"
        scrollview.addSubview(labeltituloInscripcion)
        
        let labelBodyInscripcion = UILabel(frame: CGRect(x: 10, y: 50, width: view.frame.size.width - 40 , height: 250))
        labelBodyInscripcion.textAlignment = .justified
        labelBodyInscripcion.numberOfLines = 16
        labelBodyInscripcion.font = UIFont(name: "Times New Roman", size: 18)
        labelBodyInscripcion.text = "La reinsicripción ordinaria se realiza cada semestre en el sitio oficial de servicios escolares de la Facultad de acuerdo al nùmero de inscripciòn.\nEl número de reinscripción se otorga de acuerdo al desempeño académico del semestre anterior tomando en cuenta el promedio , número de materias reprobadas y avance en el plan de estudios. Se puede consultar iniciando sesión en la página oficial de servicios escolares de la Facultad.\nLa reinscripción es responsabilidad del egresado, por lo que deberás estar atento a los requisitos y fechas señalados en la guía escolar."
        scrollview.addSubview(labelBodyInscripcion)
        
        let labeltituloExtraordinario = UILabel(frame: CGRect(x: 10, y: 320, width: view.frame.size.width - 40 , height: 20))
        labeltituloExtraordinario.textAlignment = .left
        labeltituloExtraordinario.numberOfLines = 1
        labeltituloExtraordinario.font = UIFont(name: "Times New Roman", size: 23)
        labeltituloExtraordinario.text = "*Extraordinarios"
        scrollview.addSubview(labeltituloExtraordinario)
        
        let labelBodyExtraordinario = UILabel(frame: CGRect(x: 10, y: 350, width: view.frame.size.width - 40 , height: 230))
        labelBodyExtraordinario.textAlignment = .justified
        labelBodyExtraordinario.numberOfLines = 15
        labelBodyExtraordinario.font = UIFont(name: "Times New Roman", size: 18)
        labelBodyExtraordinario.text = "Un examen extraordinario te permite aprobar una materia pero no representa una inscripción ordinaria, el registro a un extraordinario por sí solo, no permite acceder a los servicios y derechos correspondientes a un alumno inscrito de manera ordinaria.\nExisten 3 periodos de registro a exámenes extraordinarios al semestre, por semestre se te permite inscribir hasta 4 exámenes extraordinarios, pero por cada periodo, solo puedes registrar 2 exámenes. "
        scrollview.addSubview(labelBodyExtraordinario)
        
        let labeltituloASDRI = UILabel(frame: CGRect(x: 10, y: 600, width: view.frame.size.width - 40 , height: 20))
        labeltituloASDRI.textAlignment = .left
        labeltituloASDRI.numberOfLines = 1
        
        labeltituloASDRI.font = UIFont(name: "Times New Roman", size: 23)
        labeltituloASDRI.text = "*Alumnos sin derecho a Inscripción"
        scrollview.addSubview(labeltituloASDRI)
        
        let labelBodyASDRI = UILabel(frame: CGRect(x: 10, y: 630, width: view.frame.size.width - 40 , height: 190))
        labelBodyASDRI.textAlignment = .justified
        labelBodyASDRI.numberOfLines = 13
        labelBodyASDRI.font = UIFont(name: "Times New Roman", size: 18)
        labelBodyASDRI.text = "Los extraordinarios ASDRI son sólo una modalidad alterna de exámenes extraordinarios, a diferencian del extraordinario donde solo te presentas el examen, el extraordinario ASDRI te permite asistir a clases con el previo consentimiento del profesor, pero solo podrás aprobar la materia aprobando un examen, no se te calificará de acuerdo a los lineamientos de la clase del profesor."
        scrollview.addSubview(labelBodyASDRI)
        
        let labeltituloTitulacion = UILabel(frame: CGRect(x: 10, y: 840, width: view.frame.size.width - 40 , height: 20))
        labeltituloTitulacion.textAlignment = .left
        labeltituloTitulacion.numberOfLines = 1
        labeltituloTitulacion.font = UIFont(name: "Times New Roman", size: 23)
        labeltituloTitulacion.text = "*Titulación"
        scrollview.addSubview(labeltituloTitulacion)
        
        let labelBodyTitulacion = UILabel(frame: CGRect(x: 10, y: 880, width: view.frame.size.width - 40 , height: 320))
        labelBodyTitulacion.textAlignment = .justified
        labelBodyTitulacion.numberOfLines = 21
        labelBodyTitulacion.font = UIFont(name: "Times New Roman", size: 18)
        labelBodyTitulacion.text = "El proceso de titulación se compone de aquellas actividades y trámites que realiza un estudiante de la Facultad para obtener su título de licenciatura.\n\nRequisitos: \n 1.Haber cursado y aprobado el total de asignaturas y haber acreditado el 100% de los créditos establecidos en el plan de estudios. \n 2.Cumplir con el requisito de idioma determinado por el Consejo Técnico. \n 3.Presentar la constancia de haber realizado el Servicio Social, de acuerdo a la Legislación Universitaria.\n 4.Cumplir con alguna actividad de titulación definida por el Reglamento de opciones de titulación para las licenciaturas de la Facultad."
        scrollview.addSubview(labelBodyTitulacion)
        
        scrollview.contentSize = CGSize(width: view.frame.size.width - 20, height: 1230)
        }

}
