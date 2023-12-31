//
//  URL+Extension.swift
//  SnapkitStudy
//
//  Created by 장혜성 on 2023/08/27.
//

import Foundation

extension URL {
    static let baseURL = "https://dapi.kakao.com/v2/search/"
     
    static func makeEndPointString(_ endpoint: String) -> String {
        return baseURL + endpoint
    }
}
