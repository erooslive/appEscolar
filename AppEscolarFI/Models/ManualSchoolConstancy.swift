//
//  ManualRecord.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 10/09/21.
//

import Foundation
struct ManualSchoolConstancy: Restable  {
    var id: Int?
    let name: String
    let constancyStatuts: Int?
    var student_id: Int?
    
    init(name:String, constancyStatuts:Int){
        self.name = name
        self.constancyStatuts = constancyStatuts
    }

}

enum MapResult: Int{
    case unkown = 0
    case solicitado
    case recibido
    case listo
    case entregado

    func result() -> String{
        switch self {
        case .solicitado:
            return "SOLICITADO POR ALUMNO"
        case .recibido:
            return "PREPARANDO CONSTANCIA"
        case .listo:
            return "LISTO PARA ENTREGA"
        case .entregado:
            return "ENTREGADO"
        default:
            return "Error, comunicarse con servicios escolares"
        }
    
}
}
enum MapName: Int{
    case unkown = 0
    case certificado
    case constanciaTermino
    case constanciaCreditos


    func result() -> String{
        switch self {
        case .certificado:
            return "Certificado de estudios"
        case .constanciaTermino:
            return "Constancia de Termino de estudios"
        case .constanciaCreditos:
            return "Constancia de créditos"
        case .unkown:
            return "Error, comunicarse con servicios escolares"
        }
    
}
}
