////
////  NewsService.swift
////  BaoCu
////
////  Created by Nguyễn Minh on 02/07/2021.
////
//
//import Foundation
//import UIKit
//
//import Alamofire
//
//typealias CompleteGetTrending = (Bool, Data?) -> Void
//typealias CompleteFetchItem = (Bool, [ItemTrending]) -> Void
//
//class TrendingService: NSObject {
//    var title = ""
//   
//    var link = ""
//    var pubDate = ""
//  
//    
//    var items: [ItemTrending] = []
//    var foundCharacters = ""
//    
//    override init() {}
//    
//    func getResponse(url: String, completion: @escaping CompleteGetTrending) {
//        AF.request(url, method: .get)
//            .response(queue: DispatchQueue(label: "getTrending")) {
//                if let data = $0.data {
//                    completion(true, data)
//                } else {
//                    completion(false, nil)
//                }
//            }
//    }
//    
//    func fetchAllItem(fromUrl url: String, completion: @escaping CompleteFetchItem) {
//        items.removeAll()
//        let strongSelf = self
//        getResponse(url: url) { [weak self] in
//            if let data = $1 {
//                let parser = XMLParser(data: data)
//                parser.delegate = strongSelf
//                parser.parse() ? completion(true, self?.items ?? []) : completion(false, [])
//            }
//        }
//    }
//}
//
//extension TrendingService: XMLParserDelegate {
//    
//    func parser(_ parser: XMLParser, foundCharacters string: String) {
//        foundCharacters += string
//    }
//    
//    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
//        guard let element = TrendingInfo(rawValue: elementName) else { return }
//        switch element {
//        case .item:
//            newsItem.removeAll()
//        default:
//            break
//        }
//    }
//    
//    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
//        
//        guard let element = TrendingInfo(rawValue: elementName) else {
//            foundCharacters = ""
//            return
//        }
//        
//        foundCharacters = foundCharacters.trimmingCharacters(in: .whitespacesAndNewlines)
//        
//        switch element {
//        case .title:
//            title = foundCharacters
//        case .approxTraffic:
//            approxTraffic = foundCharacters
//        case .itemDescription:
//            itemDescription = foundCharacters
//        case .link:
//            link = foundCharacters
//        case .pubDate:
//            pubDate = foundCharacters
//        case .picture:
//            picture = foundCharacters
//        case .pictureSouce:
//            pictureSource = foundCharacters
//        case .newsItemTitle:
//            newsItemTitle = foundCharacters
//        case .newsItemURL:
//            newsItemURL = foundCharacters
//        case .newsItemSource:
//            newsItemSource = foundCharacters
//        case .newsItemSnippet:
//            newsItemSnippet = foundCharacters
//        case .newsItem:
//            newsItem.append(NewsItemElement(newsItemTitle: newsItemTitle, newsItemSnippet: newsItemSnippet, newsItemURL: newsItemURL, newsItemSource: newsItemSource))
//        case .item:
//            items.append(ItemTrending(title: title, approxTraffic: approxTraffic, itemDescription: itemDescription, link: link, pubDate: pubDate, picture: picture, pictureSource: pictureSource, newsItem: newsItem))
//        }
//        
//        foundCharacters = ""
//    }
//}
