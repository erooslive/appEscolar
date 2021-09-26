//
//  ManualSchoolConstancyCollectionViewCell.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 20/09/21.
//

import UIKit

class ManualSchoolConstancyCollectionViewCell: UICollectionViewCell {
    
    var manualSchoolConstancy: ManualSchoolConstancy? {
        didSet {
             updateView()
        }
    }

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateView()
        // Initialization code
    }
    func updateView()  {
        guard let manualSchoolConstancy = manualSchoolConstancy else {return }
        let status = manualSchoolConstancy.constancyStatuts
        
        switch status {
        case 1:
            self.status.text = MapResult.solicitado.result()
            self.statusImage.image = UIImage(systemName: "info.circle")
        case 2:
            self.status.text = MapResult.recibido.result()
        case 3:
            self.status.text = MapResult.listo.result()
            self.statusImage.image = #imageLiteral(resourceName: "pngegg.png")
        case 4:
            self.status.text = MapResult.entregado.result()
            self.statusImage.image = #imageLiteral(resourceName: "pngegg.png")
        default:
            self.status.text = MapResult.unkown.result()
        }
        
        let name = manualSchoolConstancy.name
        
        switch name {
        case "certificado":
            self.name.text = MapName.certificado.result()
        case "constanciaTermino":
            self.name.text = MapName.constanciaTermino.result()
        case "constanciaCreditos":
            self.name.text = MapName.constanciaCreditos.result()
        default:
            self.name.text = MapName.unkown.result()
        }

    }

}
