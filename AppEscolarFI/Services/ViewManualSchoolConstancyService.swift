//
//  ViewManualSchoolConstancyService.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 20/09/21.
//

import Foundation

struct ViewManualSchoolConstancyService {
    private var endpoint: RestClient<ManualSchoolConstancy>

    init() {
        endpoint = RestClient<ManualSchoolConstancy>(client: AmacaConfig.shared.httpClient, path: "/students/1/manual_school_constancies")
    }

    func load(completion: @escaping ([ManualSchoolConstancy]) -> Void) {
        endpoint.list { result in
            guard let manualSchoolConstancies = try? result.get() else { return }
            DispatchQueue.main.async { completion(manualSchoolConstancies) }
        }
    }
}
