//
//  StringExtension.swift
//  BaoCu
//
//  Created by Nguyễn Minh on 03/07/2021.
//

import Foundation
extension String{
    func convertToURL() -> NSAttributedString {

        guard let data = data(using: .utf8) else { return NSAttributedString() }

        do {
            let htmlAttrib = NSAttributedString.DocumentType.html
            return try NSAttributedString(data: data,
                                          options: [.documentType : htmlAttrib],
                                          documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
}
