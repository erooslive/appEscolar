//
//  Usuario.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 03/08/21.
//

import Foundation

import UIKit

struct Usuarios: Restable {
    var id: Int?
    let usuario: String
    let password: String
    let createdAt: Date?
    let updatedAt: Date?

    init(content: String, backgroundColor: String, latitude: Double? = nil, longitude: Double? = nil, image: UIImage? = nil) {
        self.usuario = "vacio"
        self.password = "vacio"
        self.createdAt = nil
        self.updatedAt = nil
    }

}
