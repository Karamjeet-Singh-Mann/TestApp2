//
//  Image+Extension.swift
//  TestApp2
//
//  Created by Karamjeet Singh Mann on 6/26/21.
//

import Foundation
import SwiftUI

extension Image {
    func data(url:URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}
