//
//  File.swift
//  SnapkitStudy
//
//  Created by 장혜성 on 2023/08/27.
//

import Foundation

import Alamofire

class KakaoAPIManager {
    
    let header: HTTPHeaders = ["Authorization":"KakaoAK \(APIKey.kakaoRESTKey)"]
    
    static let shared = KakaoAPIManager()
    private init(){}
    
    func call<T: Codable>(
        type: Endpoint,
        parameterDic: [String: Any]?,
        responseData: T.Type,
        successHandler: @escaping (_ response: T) -> (),
        failHandler: @escaping (_ error: String) -> ()
    ) {
        
        // get 통신일 때 URLComponents 사용
        // post 통신일 떄는?
        let requestUrl = type.requestURL
        var components = URLComponents(string: requestUrl)
        var queryItemList: [URLQueryItem] = []
        if let parameterDic {
            for (key, value) in parameterDic {
                queryItemList.append(URLQueryItem(name: key, value: "\(value)"))
            }
            components?.queryItems = queryItemList
        }
        
//        var parameters: Parameters = [:]
//        if let parameterDic {
//            for (key, value) in parameterDic {
//                parameters.updateValue(value, forKey: key)
//            }
//        }
        
        print("components?.url =",components?.url)
        guard let url = components?.url else { return }
        
        AF.request(url, method: .get, headers: header)
            .validate(statusCode: 200...500)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    successHandler(data)
                case .failure(let error):
                    failHandler(error.localizedDescription)
                }
            }
    }
}
