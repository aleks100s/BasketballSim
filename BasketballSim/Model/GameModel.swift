//
//  GameModel.swift
//  BasketballSim
//
//  Created by Sean Allen on 11/6/22.
//

import Foundation
import ActivityKit

final class GameModel: ObservableObject, GameSimulatorDelegate {

    @Published var gameState = GameState(homeScore: 0,
                                          awayScore: 0,
                                          scoringTeamName: "",
                                          lastAction: "")
    let simulator = GameSimulator()
	private var activity: Activity<GameAttributes>?

    init() {
        simulator.delegate = self
    }

    func didUpdate(gameState: GameState) {
        self.gameState = gameState
		
		Task {
			await activity?.update(using: .init(game: gameState))
		}
    }

    func didCompleteGame() {
		Task {
			await activity?.end(using: .init(game: simulator.endGame()), dismissalPolicy: .default)
		}
    }

    // Live Activity code goes here
	func startLiveActivity() {
		let attributes = GameAttributes(homeTeam: "warriors", awayTeam: "bulls")
		let currentGameState = GameAttributes.ContentState(game: gameState)
		do {
			activity = try Activity.request(attributes: attributes, contentState: currentGameState)
		} catch {
			print(error.localizedDescription)
		}
	}
}
