//
//  News.swift

import Foundation

struct News: Decodable {
    let author: String?
    let title: String?
    let discription: String?
    let urlToImage: String?
    let url: String?
}
struct NewsEnvelope: Decodable {
    let status: String
    let totalResults: Int
    let articles: [News]
}
