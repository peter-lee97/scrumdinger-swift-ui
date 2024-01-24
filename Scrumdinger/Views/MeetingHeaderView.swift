//
//  SwiftUIView.swift
//  Scrumdinger
//
//  Created by Peter Lee on 24/1/24.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    private var progress: Double {
        // if total seconds is less than 0, return 1
        guard totalSeconds > 0 else { return 1 }
        return Double (secondsElapsed) / Double (totalSeconds)
    }
    private var minutesRemaining: Double {
        Double (secondsRemaining/60)
    }
    var body: some View {
        VStack {
            ProgressView(value: progress)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
    }
}

#Preview {
    MeetingHeaderView(secondsElapsed: 13, secondsRemaining: 60)
        .previewLayout(.sizeThatFits)
}
