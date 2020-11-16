//
//  Result.swift
//  Digio
//
//  Created by Martha R on 16/11/2020.
//  Copyright © 2020 Martha Salomão de Moraes. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
