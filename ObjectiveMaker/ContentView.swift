//
//  ContentView.swift
//  ObjectiveMaker
//
//  Created by Rodney Dyer on 6/11/25.
//

import SwiftUI
import SwiftData
import FoundationModels


struct ContentView: View {
    @State var learningObjective: String = "After participating in this session, attendees should be able to explain change management."
    
    @State var objectiveSuggestions: ObjectiveSuggestions
    @State var session: LanguageModelSession
    
    
    public init() {
        _session = State(initialValue: LanguageModelSession() )
        _objectiveSuggestions = State(initialValue: ObjectiveSuggestions(options: [] ) )
    }
    
    private var prompt = """
                Generate a list of ObjectiveSuggesions that are properly formed  academic learning objectives.  Based on the user input.  Derived ObjectiveOptions must be crafted focusing on student outcomes, crafted using active verbs, aligned with SMART (Specific, Measurabble, achievalbe, Relevant, and Time-bound) Objectives, that can lead towards properly crafted assessments (e.g., Execute population genetic analyses using R by manipulating datasets, troubleshooting workflows, and interpreting results to make data-driven inferences about genetic diversity and structure in real populations.)
                
                The user input is: 
        """
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            TextField("Objective:", text: $learningObjective, prompt: Text("bob"))
                .lineLimit(2, reservesSpace: true)
            HStack {
                Spacer()
                Button(action: {
                    Task {
                        try? await getSuggestions()
                        print("sending it")
                    }
                }, label: {
                    Label(title: {
                        Text("Generate")
                    }, icon: {
                        Image(systemName: "gear")
                    })
                    .buttonStyle( .borderedProminent )
                })
                .disabled( learningObjective.isEmpty )
            }
            
            Divider()
            Text("Suggestions (\(self.objectiveSuggestions.options.count)):")
                .font(.title2)
            
            List( objectiveSuggestions.options, id:\.self ) { option in
                VStack(alignment: .leading) {
                    Text("\(option.title)")
                        .font(.headline)
                    Text("\(option.description)")
                        .foregroundStyle(.secondary)
                }

            }
            
            
            
        }
        .padding()
        
    }
    
    
    private func getSuggestions() async throws  {
        let response = try await session.respond(to: String("\(prompt) '\(learningObjective)'"),
                                                                 generating: ObjectiveSuggestions.self)
        self.objectiveSuggestions = response.content
    }
    
}


#Preview {
    ContentView()
}

