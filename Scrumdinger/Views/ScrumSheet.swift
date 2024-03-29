//
//  ScrumSheet.swift
//  Scrumdinger
//
//  Created by Peter Lee on 27/1/24.
//

import SwiftUI

struct NewScrumSheet: View {
    @Binding var isPresentingNewScrumView: Bool
    @Binding var scrums: [DailyScrum]
    @State private var newScrum = DailyScrum.emptyScrum
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false
                        }
                    }
                }
        }
    }
}

struct NewScrumSheet_Preview: PreviewProvider {
    static var previews: some View{
        NewScrumSheet(
            isPresentingNewScrumView: .constant(true),
            scrums: .constant(DailyScrum.sampleData)
        )
    }
}
