//
//  PokeAPIClient.swift
//  Monsterpedia
//
//  Created by Emmanuoel Eldridge on 7/30/16.
//  Copyright © 2016 Emmanuoel Haroutunian. All rights reserved.
//

import Foundation

class PokeAPIClient {
  
  static let sharedInstance = PokeAPIClient()
  
  func taskForGETMethod(_ url: URL, completionHandlerForGETMethod: @escaping (_ result: AnyObject?, _ error: NSError?)->Void) {
    let request = URLRequest(url: url)
    let session = URLSession.shared
    let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
      
      guard error == nil else {
        completionHandlerForGETMethod(nil, error as NSError?)
        return
      }
      
      guard let statusCode = (response as? HTTPURLResponse)?.statusCode , statusCode >= 200 && statusCode <= 299 else {
        let error = NSError(domain: "taskForGETMethod", code: 9, userInfo: [NSLocalizedDescriptionKey: "Could not reach server. Please try again once you have better network connectivity."])
        completionHandlerForGETMethod(nil, error)
        return
      }
      
      guard let data = data else {
        let error = NSError(domain: "taskForGETMethod", code: 10, userInfo: [NSLocalizedDescriptionKey: "Currently experiencing problems with the server. Pleae try again later."])
        completionHandlerForGETMethod(nil, error)
        return
      }
      self.parseData(data, completionHandler: completionHandlerForGETMethod)
    })
    task.resume()
  }
  
  fileprivate init(){}
}



// MARK: Helper Methods
extension PokeAPIClient {
  func buildURLFromComponents(_ scheme: String, host: String, path: String, query: [String: AnyObject]?) -> URL {
    var urlComponents = URLComponents()
    urlComponents.scheme = scheme
    urlComponents.host = host
    urlComponents.path = path
    urlComponents.queryItems = [URLQueryItem]()
    
    if let query = query {
      for (key, value) in query {
        let query = URLQueryItem(name: key, value: "\(value)")
        urlComponents.queryItems?.append(query)
      }
    }
    return urlComponents.url!
  }
  
  func parseData(_ data: Data, completionHandler: (_ result: AnyObject?, _ error: NSError?)->Void) {
    do {
      let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
      completionHandler(result as AnyObject?, nil)
    } catch let error as NSError {
      completionHandler(nil, error)
    }
  }
  
  func substituteValueInString(_ string: String, value: String, withValue newValue: String) -> String? {
    if string.range(of: value) != nil {
      let newString = string.replacingOccurrences(of: value, with: newValue)
      return newString
    } else {
      return nil
    }
  }
  
  func getMonsterHeaderJSON(for monster: Monster, completionHandler: @escaping (_ result: AnyObject?, _ error: NSError?)->Void) {
    guard let path = substituteValueInString(Constants.MonsterPath, value: "{id}", withValue: "\(monster.id)") else {
      let error = NSError(domain: "getMonsterData", code: 9, userInfo: [NSLocalizedDescriptionKey: "Failed to build URL with MonsterPath"])
      completionHandler(nil, error)
      return
    }
    
    let url = buildURLFromComponents(Constants.Scheme, host: Constants.Host, path: path, query: nil)
    print(url)
    taskForGETMethod(url) { (result, error) in
      completionHandler(result, error)
    }
  }
  
  func getFlavorTextJSON(for monster: Monster, dex: Dex, completionHandler: @escaping (_ result: AnyObject?, _ error: NSError?)->Void) {
    guard let path = substituteValueInString(Constants.TypePath, value: "{id}", withValue: "\(monster.id)") else {
      let error = NSError(domain: "getMonsterFlavorText", code: 9, userInfo: [NSLocalizedDescriptionKey: "Failed to build URL with TypePath"])
      completionHandler(nil, error)
      return
    }
    
    let url = buildURLFromComponents(Constants.Scheme, host: Constants.Host, path: path, query: nil)
    print(url)
    taskForGETMethod(url) { (result, error) in
      completionHandler(result, error)
    }
  }
  
}

enum Dex: String {
  case kanto = "red", johto = "gold", hoenn = "ruby", sinnoh = "diamond", unova = "black", kalos = "x"
}
