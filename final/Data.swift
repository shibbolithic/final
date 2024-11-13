import Foundation

// MARK: - Athlete
struct Athlete {
    var uid: UUID // Unique ID for data fetching
    var username: String // Unique username
    var name: String
    var height: Double
    var weight: Double
    var yearsOfExperience: Int
    var profileImage: String // URL as a String for simplicity
    var region: String
    var achievements: [String]
    var gamesPlayed: [Game] // Relationship with Game
    var team: Team? // Relationship with Team
    var performanceStatistics: [GameLog] // Relationship with GameLog
}

// MARK: - Coach
struct Coach {
    var uid: UUID // Unique ID for data fetching
    var username: String // Unique username
    var name: String
    var height: Double
    var weight: Double
    var yearsOfExperience: Int
    var profileImage: String // URL as a String for simplicity
    var region: String
    var teamsCoached: [Team] // Relationship with Team
    var playersCoached: [Athlete] // Relationship with Athlete
    var achievements: [String]
}

// MARK: - Team
struct Team {
    var uid: UUID // Unique ID for data fetching
    var teamName: String
    var moto:String
    var region: String
    var members: [Athlete] // Relationship with Athlete
    var coach: [Coach] // Relationship with Coach
    var wins: Int
    var losses: Int
    var ties: Int
    var performanceHistory: [GameLog] // Relationship with GameLog
    var analysisReports: [TeamAnalysis] // Relationship with Analysis
}

// MARK: - Game
struct Game {
    var gameID: UUID // Unique identifier
    var gameType: String // e.g., "friendly", "tournament"
    var teamsInvolved: [Team] // Teams involved
    var dateTime: Date
    var location: String
    var finalScore: Int // Sum of all +2 and +3 points
    var gameLogs: GameLog // Relationship with GameLog
}

// MARK: - GameLog
struct GameLog {
    var gameID: UUID // Reference to Game entity
    var playerLogs: [PlayerLog] // Array to hold logs for multiple athletes

    // Nested struct for individual player statistics within a game
    struct PlayerLog {
        var player: Athlete // Reference to Athlete entity
        var points2: Int
        var points3: Int
        var fouls: Int
        var assists: Int
        var rebounds: Int
        var freeThrows: Int
        var steals: Int
        var misses2: Int
        var misses3: Int
        var finalScore: Int { // Computed property for final score
            return (points2 * 2) + (points3 * 3)
        }
    }
}

// MARK: - Post
struct Post {
    var postID: UUID
    var author: Any // Could be Athlete or Coach
    var content: String // Text, score logs, images
    var timestamp: Date
    var linkedGame: Game? // Optional, related Game entity
    var likes: Int
    var comments: [String]
}

// MARK: - Leaderboard
struct Leaderboard {
    var regionRankings: [Team]
    var nationRankings: [Team]
    var globalRankings: [Team]
}

// MARK: - Search
struct Search {
    enum EntityType {
        case athlete
        case coach
    }
    
    var entityType: EntityType
    var attributes: [String: String] // Key-value pairs for attributes to search by
}

// MARK: - Analysis (Individual and Team)
struct IndividualAnalysis {
    var analysisID: UUID
    var player: Athlete // Reference to Athlete entity
    var performanceTrends: [String] // Could be enhanced
    var improvementSuggestions: [String]
    var gameHistory: [Game]
}

struct TeamAnalysis {
    var analysisID: UUID
    var team: Team // Reference to Team entity
    var performanceTrends: [String]
    var improvementSuggestions: [String]
    var gameHistory: [Game]
}
