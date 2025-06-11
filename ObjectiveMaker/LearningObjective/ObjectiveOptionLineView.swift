//
//  ObjectiveOptionLineView.swift
//  ObjectiveMaker
//
//  Created by Tana on 6/11/25.
//

import SwiftUI

struct ObjectiveOptionLineView: View {
    var objective: ObjectiveOption
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(objective.title)
                .font(.headline)
            Text(objective.summary)
                .foregroundStyle(.secondary)
                .lineLimit(1)
        }
    }
}

#Preview {
    ObjectiveOptionLineView( objective: ObjectiveOption.defaultObjectiveOption )
}
