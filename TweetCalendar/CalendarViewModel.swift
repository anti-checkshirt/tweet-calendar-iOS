//
//  CalendarViewModel.swift
//  TweetCalendar
//
//  Created by 築山朋紀 on 2018/12/10.
//  Copyright © 2018 tomoki. All rights reserved.
//

import Foundation
import Alamofire

struct CalendarViewModel {
    
    static func getTweet(id: String, month: String) {
        let url = "http://localhost:3001/api/v1/search"
        let parameters: Parameters = [
            "id": id,
            "date": month
        ]
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { response in
            guard let data = response.data else { return }
            switch response.result {
            case .success:
                let decoder = JSONDecoder()
                let result = try! decoder.decode(Array<Tweet>.self, from: data)
                print(result)
            case .failure(let error):
                print(error)
            }
        }
    }
}
