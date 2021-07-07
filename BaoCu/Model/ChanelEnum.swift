//
//  ChanelEnum.swift
//  BaoCu
//
//  Created by Nguyễn Minh on 02/07/2021.
//

import Foundation
enum ChannelURL : String,  CaseIterable{
   
    case trangChu = "https://vnexpress.net/rss/tin-moi-nhat.rss"
    case sucKhoe = "https://vnexpress.net/rss/suc-khoe.rss"
    case theGioi = "https://vnexpress.net/rss/the-gioi.rss"
    case giaDinh = "https://vnexpress.net/rss/gia-dinh.rss"
    case thoiSu = "https://vnexpress.net/rss/thoi-su.rss"
    case duLich = "https://vnexpress.net/rss/du-lich.rss"
    case kinhDoanh = "https://vnexpress.net/rss/kinh-doanh.rss"
    case khoaHoc = "https://vnexpress.net/rss/khoa-hoc.rss"
    case startUp = "https://vnexpress.net/rss/startup.rss"
    case soHoa = "https://vnexpress.net/rss/so-hoa.rss"
    case giaiTri = "https://vnexpress.net/rss/giai-tri.rss"
    case otoXemay = "https://vnexpress.net/rss/oto-xe-may.rss"
    case theThao = "https://vnexpress.net/rss/the-thao.rss"
    case yKien = "https://vnexpress.net/rss/y-kien.rss"
    case phapLuat = "https://vnexpress.net/rss/phap-luat.rss"
    case tamSu = "https://vnexpress.net/rss/tam-su.rss"
    case giaoDuc = "https://vnexpress.net/rss/giao-duc.rss"
    case cuoi = "https://vnexpress.net/rss/cuoi.rss"
    case xemNhieu = "https://vnexpress.net/rss/tin-xem-nhieu.rss"
    case noiBat = "https://vnexpress.net/rss/tin-noi-bat.rss"
    
    static func index(of index: ChannelURL) -> Int {
        let elements = ChannelURL.allCases

        return elements.firstIndex(of: index)!
    }

    static func element(at index: Int) -> ChannelURL? {
        let elements = ChannelURL.allCases

        if index >= 0 && index < elements.count {
            return elements[index]
        } else {
            return nil
        }
    }
}
enum ChannelName : String, CaseIterable{
    case trangChu = "Trang chủ"
    case sucKhoe = "Sức khoẻ"
    case theGioi = "Thế giới"
    case giaDinh = "Gia đình"
    case thoiSu = "Thời sự"
    case duLich = "Du lịch"
    case kinhDoanh = "Kinh doanh"
    case khoaHoc = "Khoa học"
    case startUp = "Start up"
    case soHoa = "Số hoá"
    case giaiTri = "Giải trí"
    case otoXemay = "Oto xe máy"
    case theThao = "Thể thao"
    case yKien = "Ý kiến"
    case phapLuat = "Pháp luật"
    case tamSu = "Tâm sự"
    case giaoDuc = "Giáo dục"
    case cuoi = "Cười"
    case xemNhieu = "Xem nhiều"
    case noiBat = "Nổi bật"
    
    
    static func element(at index: Int) -> ChannelName? {
        let elements = ChannelName.allCases

        if index >= 0 && index < elements.count {
            return elements[index]
        } else {
            return nil
        }
    }
    static func index(of index: ChannelName) -> Int {
        let elements = ChannelName.allCases

        return elements.firstIndex(of: index)!
    }

}

