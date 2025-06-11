//
//  ObjectiveSuggestion.swift
//  ObjectiveMaker
//
//  Created by Tana on 6/11/25.
//

import Foundation
import FoundationModels



@Generable
struct ObjectiveOption: Hashable {
    
    @Guide(description: "The name for this learning objective summarizing the description.  (e.g., Applied Population Genetic Analysis) ")
    let title: String
    
    @Guide(description: "The full description of this learning objective. ")
    let summary: String
    
}




extension ObjectiveOption {
    
    static var defaultObjectiveOption: ObjectiveOption {
        return ObjectiveOption(title: "Applied Population Genetic Analysis",
                               summary: "*Execute* population genetic analyses using R by manipulating datasets, troubleshooting workflows, and *interpreting* results to make data-driven inferences about genetic diversity and structure in real populations.")
    }
    
}



extension ObjectiveOption: CustomStringConvertible {
    var description: String {
        return "\(title): \(summary)"
    }
}



