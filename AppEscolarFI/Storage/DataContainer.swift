//
//  DataContainer.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 03/08/21.
//

import Foundation

enum DataContainer {
    case cache
    case permanent

    var baseUrl: URL {
        switch self {
        case .cache:
            return StorageType.cache.url
        case .permanent:
            return StorageType.permanent.url
        }
    }

    private func urlFor(filename: String) -> URL {
        var url = baseUrl
        url.appendPathComponent(filename)
        return url
    }

    func read(_ filename: String) -> Data? {
        return try? Data(contentsOf: urlFor(filename: filename))
    }

    func write(_ filename: String, data: Data) -> Bool {
        do {
            try data.write(to: urlFor(filename: filename))
            return true
        } catch let err {
            debugPrint("Error while writting(\(filename): \(err.localizedDescription)")
            return false
        }
    }
}
