import Foundation

struct DailyScrums {
    var title: String
    var attendes: [String]
    var lengthInMinutes: Int
    var theme: Theme
}


extension DailyScrums {
    static let sampleData: [DailyScrums] = [
        DailyScrums(
            title: "Design",
            attendes: [
                "Cathy",
                "Daisy",
                "Simon",
                "Jonathan"
            ],
            lengthInMinutes: 10,
            theme: .yellow
        )
        ,
        DailyScrums(
            title: "App Dev",
            attendes: [
                "Katie",
                "Gray",
                "Euna",
                "Luis",
                "Darla"
            ],
            lengthInMinutes: 5,
            theme: .orange
        ),
        DailyScrums(
            title: "Web Dev",
            attendes: [
                "Chella",
                "Chris",
                "Christina",
                "Eden",
                "Karla",
                "Lindsey",
                "Aga",
                "Chad",
                "Jenn",
                "Sarah"
            ],
            lengthInMinutes: 5,
            theme: .poppy
        )
    ]
}
