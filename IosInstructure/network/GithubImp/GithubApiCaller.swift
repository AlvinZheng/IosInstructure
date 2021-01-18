//
//  GithubApi.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/14.
//

import Foundation

class GithubApiCaller: ApiCaller {

    var sessionManager: SessionManager

    private var requestIntercepters: [RequestIntercepter] = []
    private var responseIntercepters: [ResponseIntercepter] = []

    func addRequestIntercepter(intercepter: RequestIntercepter) -> Self {
        requestIntercepters.append(intercepter)
        return self
    }

    func addResponseIntercepter(intercepter: ResponseIntercepter) -> Self {
        responseIntercepters.append(intercepter)
        return self
    }


    func genarateRequest(endpoint: EndPoint) -> URLRequest? {
        let urlString = endpoint.fullUrl
        //token handle
//        if let token = sessionManager.accessToken {
//             urlString = urlString + "?access_token=" + token
//        }
        guard let url = URL(string: urlString) else {
            return nil
        }
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 20)

        //handle intercepter
        requestIntercepters.forEach({$0.intercept(request: request)})
        return request
    }

    func callApi<M>(endpoint: EndPoint, mapper: ModelMapper<M>, handler: ((Response<M>) -> Void)?) {
        if let req = genarateRequest(endpoint: endpoint) {
            let task = URLSession.shared.dataTask(with: req) { [weak self] (data, resp, error) in
                //handle intercepter
                if let resp = resp {
                    self?.responseIntercepters.forEach({$0.intercept(response: resp)})
                }
                guard error == nil else {
                    handler?(.Failure(error!))
                    return
                }
                if let data = data {
                    do {
                        let model = try mapper.map(data: data)
                        handler?(.Success(model))
                    } catch let parsError {
                        handler?(.Failure(parsError))
                    }
                }else {
                    handler?(.Failure(GithubError(code: .unkown, message: "response data nil and error also nil")))
                }
            }
            task.resume()
        } else {
            handler?(.Failure(GithubError(code: .urlFormatError, message: "illegal url:" + endpoint.fullUrl)))
        }
    }

    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
        _ = addRequestIntercepter(intercepter: LogIncepter())
            .addRequestIntercepter(intercepter: HistoryRecordIntercepter())
            .addResponseIntercepter(intercepter: LogIncepter())
    }
}
