//
//  File.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 14/09/21.
//

import Foundation
struct CreateManualRecordsService {
    private var endpoint: RestClient<ManualRecords>

    init() {
        endpoint = RestClient<ManualRecords>(client: AmacaConfig.shared.httpClient, path: "/students/1/manual_records")
    }

    func create(_ model: ManualRecords, complete: @escaping (Result<ManualRecords?, Error>) -> Void ) {
        try? endpoint.create(model: model) { result in
            DispatchQueue.main.async { complete(result) }
        }
    }
}
