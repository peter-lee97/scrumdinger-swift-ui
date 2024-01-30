//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Peter Lee on 22/1/24.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @State private var isPresentingNewScrumView = false
    
    /// To observe value and save user data when become inactive
    @Environment(\.scenePhase) private var scenePhase
    
    let saveAction: ()->Void
    
    var body: some View {
        NavigationStack{
            List($scrums) {$scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)){
                    CardView(
                        scrum: scrum
                    )
                }.listRowBackground(
                    scrum.theme.mainColor
                )
            }
            .navigationTitle("Daily Scrums")
            .toolbar{
                Button(action: {
                    isPresentingNewScrumView = true
                    
                }){
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }.sheet(isPresented: $isPresentingNewScrumView){
            NewScrumSheet(
                isPresentingNewScrumView: $isPresentingNewScrumView,
                scrums: $scrums
            )
        }.onChange(of: scenePhase) { phase in
            if phase == .inactive {saveAction()}
            
        }
    }
}

#Preview {
    ScrumsView(
        scrums: .constant(DailyScrum.sampleData),
        saveAction: {}
    )
}
