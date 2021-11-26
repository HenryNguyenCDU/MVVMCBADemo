//
//  MockResponse.swift

import Foundation

struct MockResponse {
	// swiftlint:disable line_length
	static let validResponse = """
{"status":"ok", "totalResults": "38", "articles":[{"title":"Covid_Live _Updates","urlToImage":"https://static01.nyt.com/images/2021/11/25/multimedia/25-parade-promo-01/25-parade-promo-01-facebookJumbo.jpg", "url":"https://www.nytimes.com/live/2021/11/25/world/covid-vaccine-boosters-mandates"},{"title":"Unit Test","description": "", "urlToImage":"https://static01.nyt.com/images/2021/11/25/world/25xp-newark/25xp-newark-facebookJumbo.jpg", "url":"https://www.nytimes.com/2021/11/25/nyregion/new-jersey-police-officer-car-home.html"}]}
"""

	static let invalidResponse = """
{"title":"About News","rows":[{"title":"Beavers","description":"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony","imageHref":"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"}"title":"Flag","description":null,"imageHref":"http://images.findicons.com/files/icons/662/world_flag/128/flag_of_canada.png"}]}
"""
	// swiftlint:enable line_length
}
