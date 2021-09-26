//
//  Alumno.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 26/08/21.
//

import Foundation

struct Student: Restable{
    var id: Int?
    let name: String
    let accountNumber: String
    let career: String
    let currentSemester: String
    let beginningSemester: String


    init(name: String, accountNumber: String, career: String, currentSemester: String, beginningSemester: String ) {
        self.name = name
        self.accountNumber = accountNumber
        self.career = career
        self.currentSemester = currentSemester
        self.beginningSemester = beginningSemester

    }

}
