//
//  Router.swift
//  Digio
//
//  Created by Martha R on 16/11/2020.
//  Copyright © 2020 Martha Salomão de Moraes. All rights reserved.
//

import Foundation

enum Router {
    case content
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com"
    }
    
    var path: String {
        return "/sandbox/products"
    }
    
    var method: String {
        return "GET"
    }
}
