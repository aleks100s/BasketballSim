//
//  GameAttributes.swift
//  BasketballSim
//
//  Created by Alexander on 10.11.2023.
//

import ActivityKit

struct GameAttributes: ActivityAttributes {
	public struct ContentState: Codable, Hashable {
		// Dynamic stateful properties about your activity go here!
		var game: GameState
	}

	// Fixed non-changing properties about your activity go here!
	var homeTeam: String
	var awayTeam: String
}
