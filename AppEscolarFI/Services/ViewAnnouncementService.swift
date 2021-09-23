//
//  ViewAnnouncementService.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 21/09/21.
//

import Foundation

struct ViewAnnouncementService {
    private var endpoint: RestClient<Announcement>

    init() {
        endpoint = RestClient<Announcement>(client: AmacaConfig.shared.httpClient, path: "/announcements")
    }

    func load(completion: @escaping ([Announcement]) -> Void) {
        endpoint.list { result in
            guard let announcement = try? result.get() else { return }
            DispatchQueue.main.async { completion(announcement) }
        }
    }
}
