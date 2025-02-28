//
//  hotpepper_api.swift
//  Food_ranking
//
//  Created by k20108kk on 2025/02/28.
//

import Foundation
import Alamofire
import SwiftyJSON

func fetchRamenShop() {
    //ご自身のAPIをyour API keyに入れてください
    let apiKey = "your API key"
    let baseUrl = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/"

    //下記二つはURLクエリパラメータとして使用する場合、URLエンコードを行うことで正しい形でデータを送信できるようにしてます
    let apiKeyEncoded = apiKey.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    let keywordEncoded = "ラーメン".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

    //ホットペッパーグルメAPIにリクエストを送信するためのURL
    //apiKeyEncoded: エンコードされたAPIキー
    //large_area: 東京のエリアコード (Z011)
    //format: レスポンスの形式(今回はjson)
    //count: 取得する結果の件数(今回は1件のみ)
    //keywordEncoded:検索する内容(今回はラーメン)
    let urlString = "\(baseUrl)?key=\(apiKeyEncoded)&large_area=Z011&format=json&count=1&keyword=\(keywordEncoded)"

    if let url = URL(string: urlString) {
        //Alamofireを使用して作成したURLにリクエストを送信します
        AF.request(url)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    //処理が成功したら受け取ったデータをSwiftyJSONのJSONオブジェクトに変換しています
                    let json = JSON(value)
                    print(json)
                    //各データに格納していく
                    let shopData = json["results"]["shop"].arrayValue.first
                    if let shopData = shopData {
//                        name = shopData["name"].stringValue
//                        address = shopData["address"].stringValue
//                        imageUrl = shopData["photo"]["pc"]["l"].stringValue
                    }
                case .failure(let error):
                    print("API Request Error: \(error)")
                }
            }
    } else {
        print("Invalid URL: \(urlString)")
    }
}

