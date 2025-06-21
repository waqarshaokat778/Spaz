//
//  SPABase_API+Extension.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 16/08/2022.
//

import UIKit
import Alamofire

extension SPABase {
    
    private func getAPIHeader() -> HTTPHeaders {
        let header: HTTPHeaders = ["APP-USER": constants.appUser, "APP-PWD": constants.appPassword]
        return header
    }
    
    //MARK: API Helper Method
    func getAPIResponse(api: String, parameter: Parameters?, encoding: URLEncoding, method: HTTPMethod, completion:@escaping (((Data) -> Void))) {
        SPAProgress.shared.showProgress()
        AF.request(API.baseUrl + api, method: method, parameters: parameter, encoding: encoding, headers: getAPIHeader()).responseJSON(completionHandler: { [self] response in
            switch response.result {
            case .success(let JSON):
                SPAProgress.shared.hideProgress()
                let httpURLResponse = response.response
                let statusCode = httpURLResponse?.statusCode ?? 0
                
                printInConsole(msg: "API url \(API.baseUrl + api)")
                printInConsole(msg: "API name \(api)")
                printInConsole(msg: "API Status Code \(statusCode)")
                printInConsole(msg: "API Response \(JSON)")
                
                let responseData = JSON as? [String : Any]
                let status = Int(responseData?["status"] as? String ?? "") ?? 0
                if statusCode == 500 {
                    showUserMsg(msg: "Error in server communication")
                }
                else if statusCode == 404 {
                    showUserMsg(msg: responseData?["message"] as? String ?? "")
                }
                else {
                    if status == 1 {
                        completion(response.data ?? Data())
                    }
                    else {
                        showUserMsg(msg: responseData?["message"] as? String ?? "")
                    }
                }
            case .failure(let error):
                SPAProgress.shared.hideProgress()
                printInConsole(msg: "Failure\(error)")
                showUserMsg(msg: "Check your internet connection")
            }
        })
    }
}
