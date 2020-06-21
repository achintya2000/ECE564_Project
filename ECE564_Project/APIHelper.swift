//
//  APIHelper.swift
//  ECE564_Project
//
//  Created by Sebastian Williams on 6/21/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import Foundation

class APIHelper {
    init(myurl: String){
        let url = URL(string: myurl)
        let httprequest = URLSession.shared.dataTask(with: url!){ (data, response, error) in
                if error != nil
                {
                    print("error calling GET on /posts/55")
                }
                else
                {
                    do {
                        let post = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:AnyObject]
                       
                        savePost = post as NSDictionary
                        print(savePost)
                    } catch let error {
                        print("json error: \(error)")
                    }
                }

            }
            httprequest.resume()
        

    }
}
