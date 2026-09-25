//
//  JSON_to_list.swift
//  PutnamPreperation
//
//  Created by Lanqing Liu on 2026-09-24.
//

import Foundation

struct Problem: Codable, Identifiable {
    let chapter: String
    let number: Int
    let page: Int
    let pdf_page: Int
    let problem: String
    let problem_latex: String
    let needs_source_review: Bool
    
    var id: Int {
        number
    }
}

func loadProblems() -> [Problem] {
    guard let source = Bundle.main.url(forResource: "putnam_and_beyond_problems", withExtension: "json") else {
        fatalError("Problem with extracting from file!")
    }
    guard let problemData = try? Data(contentsOf: source) else {
        fatalError("Could not find convert data!")
    }
    
    let decoder = JSONDecoder()
    guard let problem = try? decoder.decode([Problem].self, from: problemData) else {
        fatalError("Problem with decoding the data!")
    }
    
    return problem
}
