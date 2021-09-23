//
//  ImageStore.swift
//  Secretly
//
//  Created by Luis Ezcurdia on 29/05/21.
//  Copyright © 2021 3zcurdia. All rights reserved.
//

import Foundation
import UIKit

enum ImageStore {
    case cache
    case permanent

    var container: DataContainer {
        switch self {
        case .cache:
            return DataContainer.cache
        case .permanent:
            return DataContainer.permanent
        }
    }

  
}
