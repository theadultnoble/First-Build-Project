//
//  ContentView.swift
//  First Build Project
//
//  Created by Theadultnoble on 09/05/2023.
//

import Foundation
import SwiftUI
import ParseSwift

struct GameScore: ParseObject, Identifiable {
    init() {
        score = 1
    }
    
    var id: String?
    var originalData: Data?
    
    // Those are required for Object
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?

    // Your own properties.
    var score: Int

    // Custom initializer.
    init(Score: Int) {
        self.score = Score
    }
}



struct ContentView: View {
    
    //: Keep an array of GameScore objects fetched from the backend.
    @State var gameScores: [GameScore] = []
    
    //: Keep track of whether the scores have been fetched or not.
    @State var scoresFetched: Bool = false
    
    var body: some View {
        VStack {
            Button("Fetch Scores") {
                //: Fetch the GameScores from the backend.
                let query = GameScore.query()
                query.find { result in
                    switch result {
                    case .success(let scores):
                        //: Update the UI with the fetched scores.
                        gameScores = scores
                        scoresFetched = true
                        print(scoresFetched)
                    case .failure(let error):
                        print("Error fetching scores: \(error)")
                    }
                }
            }
            
            //: Only show the list once the scores have been fetched.
            if scoresFetched {
                List(gameScores, id: \.objectId) { score in
                    VStack {
                        Text("Score: \(score.score)")
                        Text("ID: \(score.id)")
                        Button("Add 1") {
                            //: Add 1 to the score and save it back to the backend.
    
                            var newScore = score
                        
                            newScore.score += 1
                            newScore.save { result in
                                DispatchQueue.main.async {
                                    switch result {
                                    case .success(let savedScore):
                                        print("Saved new score: \(savedScore.score)")
                                    case .failure(let error):
                                        print("Error saving score: \(error)")
                                    }
                                }
                                
                            }
                        }
                    }
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
