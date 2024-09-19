//
//  ProblemModel.swift
//  Yeetcode
//
//  Created by Hunter Motte on 9/18/24.
//
import SwiftUI

struct Problem: Hashable, Codable {
    let name: String
    let description: String
    let difficulty: String
}

class ProblemModel: ObservableObject {
    @Published var problems: [Problem] = []
    
    func fetch() {
        guard let url = URL(string: "http://localhost:8080/api/problem") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let problems = try JSONDecoder()
                    .decode([Problem].self, from: data)
                DispatchQueue.main.async {
                    self?.problems = problems
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
