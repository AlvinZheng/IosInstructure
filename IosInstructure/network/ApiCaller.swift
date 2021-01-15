//
//  ApiCaller.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/14.
//

import Foundation

enum Response<T> {
    case Success(T)
    case Failure(Error)
}


protocol ApiCaller {
    func genarateRequest(endpoint: EndPoint) -> URLRequest?
    // M : Modle type to parse
    func callApi<M>(endpoint: EndPoint, mapper: ModelMapper<M>, handler: ((Response<M>) -> Void)?)

}


