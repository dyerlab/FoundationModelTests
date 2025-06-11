//
//  ObjectiveRequest.swift
//  ObjectiveMaker
//
//  Created by Rodney Dyer on 6/11/25.
//

import Foundation
import FoundationModels



@Generable
struct ObjectiveSuggestions {
    @Guide(description: "A list of suggested ObjectiveOptions.", .count(3) )
    var options: [ObjectiveOption]
}


@Generable
struct ObjectiveOption: Hashable {
    
    @Guide(description: "The name for this learning objective summarizing the description.  (e.g., Applied Population Genetic Analysis) ")
    let title: String
    
    @Guide(description: "The full description of this learning objective. ")
    let description: String
}





import Playgrounds


#Playground{
    
    
    //let suggestions = ObjectiveSuggestions(options: [])
    
    let prompt = """
        Generate a list of ObjectiveSuggesions that are properly formed  academic learning objectives.  Based on the user input.  Derived ObjectiveOptions must be crafted focusing on student outcomes, crafted using active verbs, aligned with SMART (Specific, Measurabble, achievalbe, Relevant, and Time-bound) Objectives, that can lead towards properly crafted assessments (e.g., Execute population genetic analyses using R by manipulating datasets, troubleshooting workflows, and interpreting results to make data-driven inferences about genetic diversity and structure in real populations.)
        
        The user input is: 'After participating in this session, attendees should be able to explain change management.'
        
        """
    
    let session = LanguageModelSession()
    //let response = try await session.respond( to: "Tell me a joke.")
    let response = try await session.respond( to: prompt,
                                                generating: ObjectiveSuggestions.self )
    
    print("\(response)")
    
    
    
}

