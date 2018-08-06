//
//  MessageService.swift
//  Smack
//
//  Created by user on 04.08.2018.
//  Copyright © 2018 user. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    var messages = [Message]()
    var selectedChannel: Channel?
    
    func findAllChannel(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else { return }
//                do {
//                    if let json = try JSON(data: data).array {
//                        for item in json {
//                        let id = item["_id"].stringValue
//                        let name = item["name"].stringValue
//                        let channelDescription = item["description"].stringValue
//                            
//                        let channel = Channel.init(channelTitle: name, channelDscription: channelDescription, id: id)
//                        self.channels.append(channel)
//                        }
//                    }
//                } catch let error {
//                    print("Error FindAllChannel\(error)")
//                }
                
                do {
                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
                } catch let error {
                    debugPrint(error as Any)
                }
                NotificationCenter.default.post(name: NOTIF_CHALLELS_LOADED, object: nil)
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func findAllMessagesForChannel(channelId: String, completion: @escaping CompletionHandler) {
        Alamofire.request("\(URL_GET_MESSAGES)\(channelId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                self.clearMessages()
                guard let data = response.data else { return }
                do {
                    self.messages = try JSONDecoder().decode([Message].self, from: data)
                } catch let error {
                    print("Error fetch all messages for channel : \(error)")
                }
                print("Messages : !!!!!------      : \(self.messages)")
                completion(true)
            } else  {
                debugPrint(response.result.error as Any)
                completion(false)
            }
            
        }
        
        
        
        
    }
    
    func clearMessages() {
        messages.removeAll()
    }
    
    func clearChannels() {
        channels.removeAll()
    }
}
