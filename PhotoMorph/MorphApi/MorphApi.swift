//
//  MorphApi.swift
//  PhotoMorph
//
//  Created by Alina on 3.07.22.
//
import Foundation
import Moya

enum MorphApi {
    case postAnimeGan(action: String, data: [String], fnIndex: Int, sessionHash: String)
    case statusAnimeGan(hash:String)
    case postArcaneGan(action: String, data: [String], fnIndex: Int, sessionHash: String)
    case statusArcaneGan(hash:String)
    case postJojoGan(action: String, data: [String], id: nil, sessionHash: String)
}

extension MorphApi: TargetType{
    var baseURL: URL {
        return URL( string:"https://hf.space")!
    }
    
    var path: String {
        switch self{
        case .postAnimeGan:
            return "/embed/akhaliq/AnimeGANv2/api/queue/push/"
        case.statusAnimeGan:
            return "/embed/akhaliq/AnimeGANv2/api/queue/status/"
        case .postArcaneGan:
            return "/embed/akhaliq/ArcaneGAN/api/queue/push/"
        case .statusArcaneGan:
            return "/embed/akhaliq/ArcaneGAN/api/queue/status/"
        case .postJojoGan:
            return "/embed/akhaliq/JoJoGAN/api/predict/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postAnimeGan, .statusAnimeGan, .postArcaneGan, .statusArcaneGan, .postJojoGan:
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
        case  .postAnimeGan, .statusAnimeGan, .postArcaneGan, .statusArcaneGan, .postJojoGan:
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
        case .postAnimeGan(let action, let data, let fnIndex, let sessionHash), .postArcaneGan(let action, let data, let fnIndex, let sessionHash):
            params["action"] = action
            params["data"] = data
            params["fn_index"] = fnIndex
            params["session_hash"] = sessionHash
        case .statusAnimeGan(let hash),.statusArcaneGan(let hash):
            params["hash"] = hash
        case .postJojoGan(let action, let data, let id, let sessionHash):
            params["action"] = action
            params["data"] = data
            params["example_id"] = id
            params["session_hash"] = sessionHash
        }
        return params
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}

