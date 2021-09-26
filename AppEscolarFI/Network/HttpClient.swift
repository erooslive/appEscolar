//
//  HttpClient.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 03/08/21.
//

import Foundation

struct HttpClient {
    let session: URLSession
    let baseUrl: String

    typealias ResultResponse = (Result<Data?, Error>) -> Void

    func get(path: String, complete: @escaping ResultResponse) {
        request(method: "get", path: path, body: nil, complete: complete)
    }

    func post(path: String, body: Data?, complete: @escaping ResultResponse) {
        request(method: "post", path: path, body: body, complete: complete)
    }

    func put(path: String, body: Data?, complete: @escaping ResultResponse) {
        request(method: "put", path: path, body: body, complete: complete)
    }

    func delete(path: String, complete: @escaping ResultResponse) {
        request(method: "delete", path: path, body: nil, complete: complete)
    }

    private func request(method: String, path: String, body: Data?, complete: @escaping ResultResponse) {
        guard let req = buildRequest(method: method, path: path, body: body) else {
            complete(.failure(RequestError.invalidRequest))
            return
        }

        session.dataTask(with: req) { (data, response, error) in
            if let error = error {
                complete(.failure(error))
                return
            }
            let response = HttpResponse(response: response)
            let result   = response.result(for: data)
            complete(result)
        }.resume()
    }

    private func buildRequest(method: String, path: String, body: Data?) -> URLRequest? {
        var builder = RequestBuilder(baseUrl: self.baseUrl)
        builder.method = method
        builder.path = path
        builder.body = body
        if let token = AmacaConfig.shared.apiToken {
            builder.headers = ["Authorization": "Bearer \(token)"]
            
        }
        //print("a vers \(builder.request())")
        return builder.request()
    }
}
