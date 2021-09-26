//
//  ViewStudentService.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 25/09/21.
//

import Foundation

struct ViewStudentService {
    private var endpoint: RestClient<Student>

    init() {
        endpoint = RestClient<Student>(client: AmacaConfig.shared.httpClient, path: "/students/1")
    }

    func load(completion: @escaping (Student) -> Void) {
        endpoint.show { result in
            guard let student = try? result.get() else { return }
            DispatchQueue.main.async { completion(student) }
        }
    }
}
