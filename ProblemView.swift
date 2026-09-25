//
//  ProblemView.swift
//  PutnamPreperation
//
//  Created by Lanqing Liu on 2026-09-24.
//

import SwiftUI

struct ProblemView: View {
    let problem: Problem
    
    var body: some View {
        ScrollView {
            VStack() {
                Text(problem.problem)
            }
        }
    }
}

