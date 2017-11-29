//
//  Model.swift
//  TestAlamofire
//
//  Created by 田腾飞 on 2016/12/12.
//  Copyright © 2016年 田腾飞. All rights reserved.
//

import UIKit
import ObjectMapper

class Model: Mappable {
    var status: Int?
    var data: ModelData?
    var msg:String?
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        status    <- map["status"]
        data        <- map["data"]
        msg          <- map["msg"]
    }
}
class ModelData: Mappable {
    var rows: Int?
    var pages: Int?
    var pageNo:Int?
    var DATA:Array<DATA>?
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        rows    <- map["rows"]
        pages        <- map["pages"]
        pageNo          <- map["pageNo"]
        DATA <- map["data"]
    }
}
class DATA: Mappable {
    var files: Array<files>?
    var modifyTime: String?
    var summary:String?
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        summary    <- map["summary"]
        modifyTime        <- map["modifyTime"]
        files          <- map["files"]
    }
}
class files: Mappable {
    var type: String?
    var ext: String?
    var path:String?
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        ext    <- map["ext"]
        path        <- map["path"]
        type          <- map["type"]
    }
}
