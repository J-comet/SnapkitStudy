//
//  Endpoint.swift
//  SnapkitStudy
//
//  Created by 장혜성 on 2023/08/27.
//

import Foundation

enum Endpoint {
    case video
    
    var requestURL: String {
        switch self {
        case .video: return URL.makeEndPointString("vclip")
        }
    }
}
