//
//  DataService.swift
//  GetAPIResponesitory
//
//  Created by DSCO on 7/3/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import Foundation
struct Entities: Codable {
    var id: Int
    //    var node_id: String
    var name: String
    var full_name: String
    //    var owner: [Owner]
}
//struct Owner: Codable {
//    var login: String
//    var avatar_url: String
//    var url: String
//    var html_url: String
//    var followers_url: String
//    var following_url: String
//    var gists_url: String
//    var starred_url: String
//}
class DataService {
    static var share = DataService()
    var entities = [Entities]()
    var nextPagePath = ""
    func getData(completedHandle: @escaping([Entities]) -> Void) {
        guard let url = URL(string: "https://api.github.com/repositories") else {return}
        let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10)
        URLSession.shared.dataTask(with: urlRequest, completionHandler: {(data, response, error) in
            guard error == nil else {return}
            guard let data = data else {return}
            let response = response as! HTTPURLResponse
            guard response.statusCode == 200 else {return}
            
            //phan trang
            //truy cap lay Link trong Header
            if let linkHeader = response.allHeaderFields["Link"] as? String {
                print(linkHeader)
                let links = linkHeader.components(separatedBy: ",")
                
                var dictionary: [String: String] = [:]
                links.forEach({
                    let components = $0.components(separatedBy:"; ")
                    let cleanPath = components[0].trimmingCharacters(in: CharacterSet(charactersIn: "<>"))
                    dictionary[components[1]] = cleanPath
                })
                
                if let nextPagePath = dictionary["rel=\"next\""] {
//                    print("nextPagePath: \(nextPagePath)")
                    self.nextPagePath = nextPagePath
                }
                
            }
            
            
            guard (response ).statusCode == 200 else {return}
            do{
                let entities = try JSONDecoder().decode([Entities].self, from: data)
                print(entities)
                self.entities = entities
                DispatchQueue.main.async {
                    completedHandle(self.entities)
                    
                }
            }catch{
                print(error.localizedDescription)
            }
        }).resume()
    }
    
    func loadMore(completedHandle: @escaping([Entities]) -> Void) {
        guard let url = URL(string: self.nextPagePath) else {return}
        let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 1)
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data,response, error) in
            guard error == nil else {return}
            guard let data = data else {return}
            let response = response as! HTTPURLResponse
            guard response.statusCode == 200 else {return}
            if let linkHeader = response.allHeaderFields["Link"] as? String{
                let links = linkHeader.components(separatedBy: ",")
                var dictionary: [String:String] = [:]
                links.forEach({
                    let components = $0.components(separatedBy: ";")
                    let link = components[0].trimmingCharacters(in: CharacterSet(charactersIn: "<>"))
                    dictionary[components[1]] = link
                })
                if let nextPagePath = dictionary[" rel=\"next\""]{
//                    print("nextPagePath: \(nextPagePath)")
                    self.nextPagePath = nextPagePath
                } else {
                    self.nextPagePath = ""
                }
            }
            do{
                let dataResutl = try JSONDecoder().decode([Entities].self, from: data)
                self.entities  += dataResutl
                DispatchQueue.main.async {
                    completedHandle(self.entities)
                }
            }catch{
                print(error.localizedDescription)
            }
            
        }).resume()
    }
    
    
}
