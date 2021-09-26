//
//  SelectConstancyViewController.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 14/09/21.
//

import UIKit


struct EmptyPostError: Error {}

protocol ManualRecordsDelegate {
    func didCreateManualRecord(manualRecord: ManualSchoolConstancy?)
}
class SelectConstancyViewController: UIViewController {
    
    let createService = CreateManualRecordsService()
    var arrayDocument: [String]?
    var delegate: ConstancyRequestViewController?
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func solicitaCertificado(_ sender: Any) {

        if ((arrayDocument?.contains("certificado.1")) == true || (arrayDocument?.contains("certificado.2")) == true || (arrayDocument?.contains("certificado.3")) == true){
            errorAlertConstanciaRepetida()
        }
        else{
            do{
                try self.createManualRecord(tipoDocumento: "certificado")
                        self.dismiss(animated: true)
                self.arrayDocument?.append("certificado.1")
                } catch let err {
                    self.errorAlert(err)
                    }
        }
    }
    
    @IBAction func solicitaConstanciaTermino(_ sender: Any) {
        if ((arrayDocument?.contains("constanciaTermino.1")) == true || (arrayDocument?.contains("constanciaTermino.2")) == true || (arrayDocument?.contains("constanciaTermino.3")) == true){
            errorAlertConstanciaRepetida()
            print("mal")
        }
        else{
            do{
                try self.createManualRecord(tipoDocumento: "constanciaTermino")
                    self.arrayDocument?.append("constanciaTermino.1")
                    self.dismiss(animated: true)
                } catch let err {
                        self.errorAlert(err)
                    }
        }
    }
    
    @IBAction func solicitaConstanciaCreditos(_ sender: Any) {
        if ((arrayDocument?.contains("constanciaCreditos.1")) == true || (arrayDocument?.contains("constanciaCreditos.2")) == true || (arrayDocument?.contains("constanciaCreditos.3")) == true){
            errorAlertConstanciaRepetida()
            print("mal")
        }
        else{
            do{
                try self.createManualRecord(tipoDocumento: "constanciaCreditos")
                    self.arrayDocument?.append("constanciaCreditos.1")
                    self.dismiss(animated: true)
                } catch let err {
                        self.errorAlert(err)
                    }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let requisitosView = segue.destination as? RequirementViewController
    
        if (segue.identifier == "requisitoCertificado"){
            requisitosView?.stringTitulo = "Certificado de estudios"
            requisitosView?.stringEspecificaciones = "Documento que indica si ya terminaste aprobatoriamente tu carrera o no, lista todas las materias que cursaste en tu trayectoria con calificaciones, firmada y con sello en relieve\n*Tiempo de emsión: 3 semanas"
            requisitosView?.stringRequisitos = "*2 fotografías por cada certificado, ovaladas (5 x 3.5 cm). \n -Medidas del rostro en la fotografía: ancho de cara de 2 cm y de la frente a la barbilla 2.5 cm. No se aceptan fotografías escaneadas.\n -Blanco y negro o a color con retoque e impresas en papel mate delgado,recientes, iguales, de frente, rostro serio. \n -HOMBRES: Saco y corbata. Si se tiene cabello largo, deberá estar completamente recogido hacia atrás. Patilla y/o barba y/o bigote recortados (deben distinguirse claramente labios y orejas). \n -MUJERES: Vestimenta formal, sin ningún tipo de escote. Maquillaje muy discreto. Si se tiene cabello largo, deberá estar completamente recogido hacia atrás o suelto hacia la espalda. Aretes pequeños.\n *Si es el primer certificado que solicitas, se expide gratuitamente, de no ser así, en tu cita deberás llevar comprobante de pago de cajas de la Facultad."
        }
        else if (segue.identifier == "ConstanciaTermino"){
            requisitosView?.stringTitulo = "Constancia de Termino de estudios"
            requisitosView?.stringEspecificaciones = "Documento que indica que has terminado tu carrera de acuerdo a tu plan de estudios correspondiente, se indica tu promedio y el tiempo en el que aprobaste todas tus materias"
            requisitosView?.stringRequisitos = "En caso de no haber acreditado todas tus materias, se te otorgara una costancia equivalente que indique el número de créditos que te hacen falta.\nSin requisitos adicionales"
        }
        else if (segue.identifier == "constanciaCreditos"){
            requisitosView?.stringTitulo = "Constancia de créditos"
            requisitosView?.stringEspecificaciones = "Documento que indica el avance en tu carrera de acuerdo al plan de estudios correspondientes, dicho avance se indca en porcentaje y en número de créditos."
            requisitosView?.stringRequisitos = "Sin requisitos adicionales"
        }
    }
    
    private func createManualRecord(tipoDocumento: String) throws {
        let manualRecord = try self.buildManualRecord(tipoDocumento: tipoDocumento)
        
        createService.create(manualRecord) { [unowned self] result in
            switch result {
            case .success(let manualRecord):
                delegate?.didCreateManualRecord(manualRecord: manualRecord)

            case .failure(let err):
                delegate?.didCreateManualRecord(manualRecord: manualRecord)
                print("error: \(err)")
            }
        }
    }
    private func buildManualRecord(tipoDocumento: String) throws -> ManualSchoolConstancy {
        
        let manualRecords = ManualSchoolConstancy(
            name: tipoDocumento,
            constancyStatuts: 1
        )
        return manualRecords
    }
    
    func errorAlert(_ error: Error) {
        let err = error as? Titleable
        let alert = UIAlertController(title: (err?.title ?? "Server Error"), message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    func errorAlertConstanciaRepetida() {
        
        let alert = UIAlertController(title: "Ya se encuentra una solicitud en curso ", message: "Solo puedes solicitar una constancia a la vez, faor de esperar cambio de status  para solicitar una nueva", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
