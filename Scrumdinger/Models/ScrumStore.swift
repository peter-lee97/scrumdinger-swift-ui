//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Peter Lee on 27/1/24.
//

import Foundation
import SwiftUI

@MainActor // To tell OS that main thread depends on data from this class
class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        )
        .appendingPathComponent("scrums.data")
    }
    
    func load() async throws {
        
        /// Creates a constant task within the function for fetching [DailyScrums]
        let task = Task<[DailyScrum], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else { return [] }
                
            // Return [DailyScrums]
            return try JSONDecoder().decode([DailyScrum].self, from: data)
        }
            
        let scrums = try await task.value
        self.scrums = scrums
    }
    
    func save(scrums: [DailyScrum]) async throws {
        /// creates a task instance constant for encoding
        let task = Task {
            let data = try JSONEncoder().encode(scrums)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
