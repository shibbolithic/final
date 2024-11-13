import Foundation

// Mock Data for Athletes
let mockAthletes: [Athlete] = [
    Athlete(
        uid: UUID(),
        username: "athlete1",
        name: "John Doe",
        height: 6.1,
        weight: 190.0,
        yearsOfExperience: 5,
        profileImage: "Image1",
        region: "North America",
        achievements: ["MVP Award 2022", "All-Star Player 2021"],
        gamesPlayed: [],
        team: nil,
        performanceStatistics: []
    ),
    Athlete(
        uid: UUID(),
        username: "athlete2",
        name: "Jane Smith",
        height: 5.9,
        weight: 170.0,
        yearsOfExperience: 3,
        profileImage: "Image2",
        region: "Europe",
        achievements: ["Rookie of the Year 2023"],
        gamesPlayed: [],
        team: nil,
        performanceStatistics: []
    )
]

//// Mock Data for Coaches
//let mockCoaches: [Coach] = [
//    Coach(
//        uid: UUID(),
//        username: "coach1",
//        name: "Michael Johnson",
//        height: 6.0,
//        weight: 200.0,
//        yearsOfExperience: 10,
//        profileImage: "Image3",
//        region: "Asia",
//        teamsCoached: [],
//        playersCoached: [],
//        achievements: ["Coach of the Year 2021", "Championship Winner 2020"]
//    ),
//    Coach(
//        uid: UUID(),
//        username: "coach2",
//        name: "Laura Lee",
//        height: 5.7,
//        weight: 150.0,
//        yearsOfExperience: 8,
//        profileImage: "Image4",
//        region: "South America",
//        teamsCoached: [],
//        playersCoached: [],
//        achievements: ["Silver Medalist 2019"]
//    )
//]
