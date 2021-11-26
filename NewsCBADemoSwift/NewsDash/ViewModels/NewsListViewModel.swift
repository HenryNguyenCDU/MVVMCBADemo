//
//  NewsListViewModel.swift


import Foundation

class NewsListViewModel {
    
    var newsVM = [NewsViewModel]()
    
    let reuseID = "news"
    
    func getNews(_url: String, completion: @escaping ([NewsViewModel]) -> Void) {
        NetworkManager.shared.getNews(_url: _url) { (news) in
            guard let news = news else { return }
            let newsVM = news.map(NewsViewModel.init)
            DispatchQueue.main.sync {
                self.newsVM = newsVM
                completion(newsVM)
            }
        }
    }
}
