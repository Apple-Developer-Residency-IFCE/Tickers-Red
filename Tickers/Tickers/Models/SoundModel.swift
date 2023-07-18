//
//  SoundModel.swift
//  Tickers
//
//  Created by Oliver Santos on 30/06/23.
//

import Foundation

struct Sound: Hashable {
    let id: Int
    let title: String
    var isPlay: Bool = false
    var isDownload: Bool
    let path: URL
}
