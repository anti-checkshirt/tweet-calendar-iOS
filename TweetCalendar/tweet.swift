//
//  tweet.swift
//  TweetCalendar
//
//  Created by 築山朋紀 on 2018/12/10.
//  Copyright © 2018 tomoki. All rights reserved.
//

import Foundation

struct Tweet: Codable {
    
    /// ツイートの内容
    let text: String
    
    /// ツイートされた日時
    let createdAt: String
    
    /// Twitterのid
    let id: String
    
    /// プロフィール画像のURL
    let profileImageURL: String
}

extension Tweet {
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
        case createdAt = "tweet_created_at"
        case id = "screen_name"
        case profileImageURL = "profile_image_url"
    }
}
