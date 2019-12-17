//
//  NetworkClass.swift
//  UrbanPaw
//
//  Created by Mac User on 13/12/19.
//  Copyright © 2019 Mac User. All rights reserved.
//

import Foundation
import Alamofire

//let kAPIHost = "http://3.213.33.73/APIT/public/api/"

class NetworkClass{
    static var shared = NetworkClass()
    
    func postDetailsToServer(withUrl strURL: String,withParam postParam: Dictionary<String, Any>,completion:@escaping (_ isSuccess: Bool, _ response:NSDictionary) -> Void)
    {
        
        
        let url = Constant.kAPIHost+strURL
        print("url",url)
        
        AF.request(url, method: .post, parameters: postParam, encoding: JSONEncoding.default, headers: [:]).responseJSON {
            response in
            switch (response.result) {
           case .success(let value):


//                print(response)
//                print(response.result.value as Any)
//                let json = response.result.value as? NSDictionary
//                completion(true,json!);
               print(response)
               print(value as Any)
               let json = value as? NSDictionary
               completion(true,json!);
                
               
            case .failure(let error):
                completion(false,[:])
                print(error)


            }
            
            
        }
        
    }
    func getDetailsFromServer(withUrl strURL: String,completion:@escaping (_ isSuccess: Bool, _ response:NSDictionary) -> Void)
    {
        
        
        let url = Constant.kAPIHost+strURL
        
        
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: [:]).responseJSON {
            response in
            switch (response.result) {
            case .success(let value):


                print(response)
                print(value as Any)
                let json = value as? NSDictionary
                completion(true,json!);

                break
            case .failure(let error):

                completion(false,[:]);

                print(error)

            }


            
        }
        
    }
}
