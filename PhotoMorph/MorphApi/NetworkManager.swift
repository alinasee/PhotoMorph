//
//  NetworkManager.swift
//  PhotoMorph
//
//  Created by Alina on 3.07.22.
//

import Foundation
import Moya
import Moya_ObjectMapper

class NetworkManager {
    private static let provider = MoyaProvider<MorphApi>(plugins: [NetworkLoggerPlugin()])

    static func postAnimeArcaneGan( sessionHash: String, payloadVersion: String, success: ((PostApiResponseModel) -> ())?, failure: (() -> ())?) {
        let prefix = "data:image/jpeg;base64,"
        let fnIndex = 0
        let action = "predict"
        let data = [prefix + PhotoVC.imageBase64toSend, payloadVersion]
        provider.request(.postAnimeGanV1(action: action, data: data, fnIndex: fnIndex, sessionHash: sessionHash)) { result in
            switch result {
            case .success(let response):
                guard let responseInfo = try? response.mapObject(PostApiResponseModel.self) else {
                    print("Не удалось распарсить ответ от сервера")
                    failure?()
                    return
                }
                print("Удалось получить ответ от сервера.")
                success?(responseInfo)
            case .failure(let error):
                print(error.localizedDescription)
                failure?()
            }
        }
    }
    
    static func statusAnimeArcaneGan(hash: String, success: ((StatusApiResponseModel) -> ())?, failure: (() -> ())?) {
        provider.request(.statusAnimeCanV1(hash: hash)) { result in
            switch result {
            case .success(let response):
                guard let responseInfo = try? response.mapObject(StatusApiResponseModel.self) else {
                    print("Не удалось распарсить ответ от сервера")
                    failure?()
                    return
                }
                print("Удалось получить ответ от сервера.")
                print(try! response.mapJSON())
                success?(responseInfo)
            case .failure(let error):
                print(error.localizedDescription)
                failure?()
            }
        }
    }
}
