//
//  CreateManualRecordsService.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 14/09/21.
//

import Foundation
struct CreateManualRecordsService {
    private var endpoint: RestClient<ManualSchoolConstancy>

    init() {
        endpoint = RestClient<ManualSchoolConstancy>(client: AmacaConfig.shared.httpClient, path: "/students/1/manual_school_constancies")
    }

    func create(_ model: ManualSchoolConstancy, complete: @escaping (Result<ManualSchoolConstancy?, Error>) -> Void ) {
        try? endpoint.create(model: model) { result in
            DispatchQueue.main.async { complete(result) }
        }
    }
}
