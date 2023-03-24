//
//  URLFunctions.swift
//  Magic
//
//  Created by Viraj Patel on 3/24/23.
//

import Foundation

class URLFunctions {
    static func getUnemploymentRate() {
        let url = "https://api.stlouisfed.org/fred/series/observations?series_id=UNRATE&api_key=fd8be39be303200cff5f927f7898f738&file_type=json"
        var request = URLRequest(url: URL(string: url)!, timeoutInterval: .infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            // print(String(data: data, encoding: .utf8)!)
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                print("Unemployment JSON: \n\(json)")
            } else {
                //handle myStruct being nil
                print("Error")
            }
        }
        task.resume()
    }
    
    static func getPrimeRate() {
        
    }
}
