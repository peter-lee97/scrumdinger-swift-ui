//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Peter Lee on 21/1/24.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 10, total: 15)
            HStack{
                VStack(alignment: .leading){
                    Text("Seconds Elasped").font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing){
                    Text("Seconds Remaining").font(.caption)
                    Label("600", systemImage:  "hourglass.bottomhalf.fill")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time Remaining")
            .accessibilityValue("10 minutes")
            Circle().strokeBorder(lineWidth: 24)
            HStack{
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/ ) {
                    Image(systemName: "forward.fill")
                }.accessibilityLabel("Next speaker")
            }
        }.padding()
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
