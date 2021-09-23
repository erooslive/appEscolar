//
//  HttpResponse.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 03/08/21.
//

import Foundation

struct HttpResponse {
    let httpUrlResponse: HTTPURLResponse

    init(response: URLResponse?) {
        self.httpUrlResponse = (response as? HTTPURLResponse) ?? HTTPURLResponse()
    }

    var status: StatusCode {
        return StatusCode(rawValue: self.httpUrlResponse.statusCode)
    }

    func result(for data: Data?) -> Result<Data?, Error> {
        return status.result().map { _ in data }
    }
}
