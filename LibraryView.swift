//
//  LibraryView.swift
//  PutnamPreperation
//
//  Created by Lanqing Liu on 2026-09-24.
//

import SwiftUI

struct LibraryView: View {
    
    let problems = loadProblems()
    
    var body: some View {
        NavigationStack {
            List(problems) { problem in
                NavigationLink {
                    ProblemView(problem: problem)
                } label: {
                    ProblemBlock(problem: problem)
                }
            }
        }
    }
}

#Preview {
    LibraryView()
}
