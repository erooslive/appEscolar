//
//  RequestError.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 03/08/21.
//

import Foundation

enum RequestError: Error, Titleable {
    case invalidRequest

    var title: String {
        switch self {
        case .invalidRequest:
            return "Invalid Request"
        }
    }
}
