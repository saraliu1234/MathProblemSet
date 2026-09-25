//
//  ProblemBlock.swift
//  PutnamPreperation
//
//  Created by Lanqing Liu on 2026-09-24.
//

import Foundation
import SwiftUI

struct ProblemBlock: View {
    let problem: Problem
    
    var body: some View {
        VStack() {
            Text(problem.problem_latex)
                .lineLimit(2)
        }
    }
}
