//
//  HTTPRequestTool.swift
//  RXSwiftDemo
//
//  Created by 新龙科技 on 2017/2/9.
//  Copyright © 2017年 新龙科技. All rights reserved.
//

import UIKit
import Moya

let URLString = "http://172.16.1.10:8080"

let HttpTool = MoyaProvider<HTTPTool>()
enum HTTPTool {
    case unread(ImgData:Data)
}
extension HTTPTool : TargetType {
    var headers: [String : String]? {
        return nil
    }
    
    public var baseURL: URL {
        print("BaseURL:\(URLString)")
        return URL(string: URLString)!
    }
    
    public var path: String {
        switch self {
        case .unread(_):
            print("path:/egov/api/upload")
            return "/egov/api/upload"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .unread(_):
            return .post
        }
    }
    
    public var parameters: [String : Any]? {
        switch self {
        case .unread(_):
            return nil
        }
    }
    
    public var parameterEncoding: ParameterEncoding {
        switch self {
        case .unread(_):
            return URLEncoding.default
        }
    }
    
    public var task: Task {
        switch self {
        case .unread(let imgData):
            return .uploadMultipart([MultipartFormData.init(provider: MultipartFormData.FormDataProvider.data(imgData), name: "file", fileName: "龙猫.jpg", mimeType: "jpg")])
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .unread:
            return "".data(using: String.Encoding.utf8)!
        }
    }
    
}
