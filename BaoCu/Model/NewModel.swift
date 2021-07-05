//
//  NewModel.swift
//  BaoCu
//
//  Created by Nguyễn Minh on 02/07/2021.
//

import Foundation
struct ChannelNew{
    var items : [Item]
    
}
struct Item{
    var title : String?
    var pubDate: String?
    var link: String?
    var descriptionNews : Description?
    var numCmt : String?
}

struct Description{
    var description : String?
    var urlImg: String?
}
