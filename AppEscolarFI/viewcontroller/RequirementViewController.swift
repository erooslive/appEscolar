//
//  RequirementViewController.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 23/09/21.
//

import UIKit

class RequirementViewController: UIViewController {

    @IBOutlet weak var tempTitle: UILabel!
    @IBOutlet weak var especificaciones: UILabel!
    @IBOutlet weak var requisitos: UILabel!
    
    var stringTitulo: String?
    var stringEspecificaciones: String?
    var stringRequisitos: String?
    
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tempTitle.text = stringTitulo
        self.requisitos.text = stringEspecificaciones
        self.especificaciones.text = stringRequisitos
        // Do any additional setup after loading the view.
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
