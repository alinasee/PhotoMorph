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
    case postAnimeGanV2(action: String, data: [String], fnIndex: Int, sessionHash: String)
    case statusAnimeCanV2(hash:String)
    case postArcaneGanV1(action: String, data: [String], fnIndex: Int, sessionHash: String)
    case statusArcaneGanV1(hash:String)
    case postArcaneGanV2(action: String, data: [String], fnIndex: Int, sessionHash: String)
    case statusArcaneGanV2(hash:String)
    case postArcaneGanV3(action: String, data: [String], fnIndex: Int, sessionHash: String)
    case statusArcaneGanV3(hash:String)
}

extension MorphApi: TargetType{
    var baseURL: URL {
        return URL( string:"https://hf.space")!
    }
    
    var path: String {
        switch self{
        case .postAnimeGanV1, .postAnimeGanV2:
            return "/embed/akhaliq/AnimeGANv2/api/queue/push/"
        case.statusAnimeCanV1, .statusAnimeCanV2:
            return "/embed/akhaliq/AnimeGANv2/api/queue/status/"
        case .postArcaneGanV1, .postArcaneGanV2, .postArcaneGanV3:
            return "/embed/akhaliq/ArcaneGAN/api/queue/push/"
        case .statusArcaneGanV1, .statusArcaneGanV2, .statusArcaneGanV3:
            return "/embed/akhaliq/ArcaneGAN/api/queue/status/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postAnimeGanV1, .statusAnimeCanV1,.postAnimeGanV2, .statusAnimeCanV2, .postArcaneGanV1, .postArcaneGanV2, .postArcaneGanV3,.statusArcaneGanV1, .statusArcaneGanV2, .statusArcaneGanV3:
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
        case .postAnimeGanV1, .statusAnimeCanV1,.postAnimeGanV2, .statusAnimeCanV2, .postArcaneGanV1, .postArcaneGanV2, .postArcaneGanV3,.statusArcaneGanV1, .statusArcaneGanV2, .statusArcaneGanV3:
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
            case .postAnimeGanV1(let action, let data, let fnIndex, let sessionHash), .postAnimeGanV2(let action, let data, let fnIndex, let sessionHash), .postArcaneGanV1(let action, let data, let fnIndex, let sessionHash), .postArcaneGanV2(let action, let data, let fnIndex, let sessionHash), .postArcaneGanV3(let action, let data, let fnIndex, let sessionHash):
                params["action"] = action
                params["data"] = data
                params["fn_index"] = fnIndex
                params["session_hash"] = sessionHash
            case .statusAnimeCanV1(let hash),.statusAnimeCanV2(let hash),.statusArcaneGanV1(let hash),.statusArcaneGanV2(let hash),.statusArcaneGanV3(let hash):
                params["hash"] = hash
            }
            return params
        }
//  переопределяет секцию успеха. При таком переопределении успехом будут считаться ответы сервера с кодом "200..", "300..". ответы "400.." попадут в секцию failure.
    var validationType: ValidationType {
        return .successCodes
    }
}

