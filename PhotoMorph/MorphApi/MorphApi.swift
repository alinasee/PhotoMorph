//
//  MorphApi.swift
//  PhotoMorph
//
//  Created by Alina on 3.07.22.
//
import Foundation
import Moya

enum MorphApi {
    case postAnimeGanV1(action: String, data: [String], fnIndex: Int, sessionHash: String)
    case statusAnimeCanV1(hash:String)
}

extension MorphApi: TargetType{
    var baseURL: URL {
        return URL( string:"https://hf.space")!
    }
    
    var path: String {
        switch self{
        case .postAnimeGanV1:
            return "/embed/akhaliq/AnimeGANv2/api/queue/push/"
        case.statusAnimeCanV1:
            return "/embed/akhaliq/AnimeGANv2/api/queue/status/"
        }
    }
    var method: Moya.Method {
        switch self {
        case .postAnimeGanV1, .statusAnimeCanV1:
            return.post
        }
    }
    var sampleData: Data {
        return Data()
    }
        var task: Task {
        guard let params = parameters else {
            return.requestPlain
        }
        return .requestParameters(parameters: params, encoding: encoding)
    }
    
    var headers: [String : String]? {
        switch self {
        case .postAnimeGanV1, .statusAnimeCanV1:
        return ["content-type" : "application/json"]
        }
}
    var encoding: ParameterEncoding{
        switch self {
        default:
            return JSONEncoding.prettyPrinted
        }
    }
    
        var parameters: [String: Any]? {
            var params = [String: Any]()
            
            switch self {
            case .postAnimeGanV1(let action, let data, let fnIndex, let sessionHash):
                params["action"] = action
                params["data"] = data
                params["fn_index"] = fnIndex
                params["session_hash"] = sessionHash
                
            case .statusAnimeCanV1(hash: let hash):
                params["hash"] = hash
            }
            return params
        }
//  переопределяет секцию успеха. При таком переопределении успехом будут считаться ответы сервера с кодом "200..", "300..". ответы "400.." попадут в секцию failure.
    var validationType: ValidationType {
        return .successCodes
    }
}

