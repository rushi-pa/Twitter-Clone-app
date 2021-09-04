//
//  TweetViewModel.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-09-04.
//

import SwiftUI
class TweetViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    init() {
        fetchTweets()
    }
    func fetchTweets(){
        COLLECTION_Tweet.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            self.tweets = documents.map({ Tweet(dictionary: $0.data())
            })
        }
    }
}
