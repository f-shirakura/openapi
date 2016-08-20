//
//  ViewController.swift
//  OpenAPI
//
//  Created by Apple on 2016/08/20.
//  Copyright © 2016年 f.shirakura. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let hostName = "www.chiikinogennki.soumu.go.jp"
        let version = "v001"
        let jenre = "博物館"
        let outputFormat = "json"
        let parameter = "limit=10"
        
        var urlString = "https://\(hostName)/k-cloud-api/\(version)/kanko/\(jenre)/\(outputFormat)?\(parameter)"
        
        urlString = urlString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        

        
        Alamofire.request(.GET, urlString)
        .responseJSON { response in
            
            
            let resultValue = response.result.value!
            let jsonData = resultValue["tourspots"] as AnyObject!
            let json = JSON(jsonData)
            
            
            json.forEach({ (_, tempjson) in
                let name = tempjson["name"]["name1"]["written"].string
                print(name)
            })
            
            
     
        }
        
        // https://<ホスト名>/k-cloud-api/<バージョン>/kanko/<ジャンル>/<出力データ形式>?<パラメータ群>
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

