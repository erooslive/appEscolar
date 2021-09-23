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
    
    @IBOutlet weak var close: UIButton!
    
    @IBAction func solicitaCertificado(_ sender: Any) {
        if ((arrayDocument?.contains("certificado")) == true){
            errorAlertConstanciaRepetida()
            print("mal")
        }
        else{
            do{
                try self.createManualRecord(tipoDocumento: "certificado")
                        self.dismiss(animated: true)
                self.arrayDocument?.append("certificado")
                } catch let err {
                    self.errorAlert(err)
                    }
        }
    }
    
    @IBAction func solicitaConstanciaTermino(_ sender: Any) {
        if ((arrayDocument?.contains("constanciaTermino")) == true){
            errorAlertConstanciaRepetida()
            print("mal")
        }
        else{
            do{
                try self.createManualRecord(tipoDocumento: "constanciaTermino")
                    self.arrayDocument?.append("constanciaTermino")
                    self.dismiss(animated: true)
                } catch let err {
                        self.errorAlert(err)
                    }
        }
    }
    
    
    @IBAction func solicitaConstanciaCreditos(_ sender: Any) {
        if ((arrayDocument?.contains("constanciaCreditos")) == true){
            errorAlertConstanciaRepetida()
            print("mal")
        }
        else{
            do{
                try self.createManualRecord(tipoDocumento: "constanciaCreditos")
                    self.arrayDocument?.append("constanciaCreditos")
                    self.dismiss(animated: true)
                } catch let err {
                        self.errorAlert(err)
                    }
        }
    }
    
    
    @IBAction func requisitoCertificado(_ sender: Any) {
    }
    
    
    @IBAction func requisitoConstanciaTermino(_ sender: Any) {
    }
    
    @IBAction func requisitoConstanciaCredito(_ sender: Any) {
    }
    
    
   

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("contains \(String(describing: arrayDocument?.contains("a")))")

        // Do any additional setup after loading the view.
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
