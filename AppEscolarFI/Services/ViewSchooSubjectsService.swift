//
//  FeedService.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 03/08/21.
//

import Foundation

struct ViewSchooSubjectsService {
    private var endpoint: RestClient<SchoolSubject>

    init() {
        endpoint = RestClient<SchoolSubject>(client: AmacaConfig.shared.httpClient, path: "/students/1/school_subjects")
    }

    func load(completion: @escaping ([SchoolSubject]) -> Void) {
        endpoint.list { result in
            guard let schoolsubjects = try? result.get() else { return }
            DispatchQueue.main.async { completion(schoolsubjects) }
        }
    }
}
