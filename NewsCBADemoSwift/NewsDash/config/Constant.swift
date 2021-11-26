//
//  Constant.swift
import Foundation

/// Application constants
struct Constant {
	static let appName = ""

	/// Messages
	struct Message {
		static let descriptionNotAvailable = "Description not available"
		static let titleNotAvailable = "Title not available"
	}

	/// App endpoint URLS
	///
	/// - url
	enum AppUrl: String {
        
		case feed = "https://newsapi.org/v2/top-headlines?country=us&apiKey=ff22005d7cff4821a6d1f75ae66e19f2"
	}
}

/// App specific error
struct AppError: LocalizedError {
	let errorDescription: String?

	/// Unknown error case
	static let unknownError = AppError(errorDescription: "Unknown Error")

	/// API endpoint not available error
	static let apiEndpointError = AppError(errorDescription: "API endpoint not found")

	/// Network related error
	static let networkError = AppError(errorDescription: "Unable to perform data refresh, please try again later")
}
