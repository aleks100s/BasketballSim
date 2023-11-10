//
//  GameWidgetLiveActivity.swift
//  GameWidget
//
//  Created by Alexander on 10.11.2023.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct GameLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: GameAttributes.self) { context in
			LiveActivityView(attributes: context.attributes, state: context.state.game)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
					HStack {
						Image(context.attributes.homeTeam)
							.teamLogoModifier(frame: 40)
						Text("\(context.state.game.homeScore)")
							.font(.title)
							.fontWeight(.semibold)
					}
                }
                DynamicIslandExpandedRegion(.trailing) {
					HStack {
						Text("\(context.state.game.awayScore)")
							.font(.title)
							.fontWeight(.semibold)
						
						Image(context.attributes.awayTeam)
							.teamLogoModifier(frame: 40)
					}
                }
                DynamicIslandExpandedRegion(.bottom) {
					HStack {
						Image(context.state.game.scoringTeamName)
							.teamLogoModifier(frame: 20)
						
						Text("\(context.state.game.lastAction)")
					}
                }
            } compactLeading: {
				HStack {
					Image(context.attributes.homeTeam)
						.teamLogoModifier()
					Text("\(context.state.game.homeScore)")
						.fontWeight(.semibold)
				}
            } compactTrailing: {
				HStack {
					Text("\(context.state.game.awayScore)")
						.fontWeight(.semibold)
					
					Image(context.attributes.awayTeam)
						.teamLogoModifier()
				}
            } minimal: {
				Image(context.state.game.winningTeamName)
					.teamLogoModifier()
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension GameAttributes {
    fileprivate static var preview: GameAttributes {
        GameAttributes(homeTeam: "Kek", awayTeam: "Lol")
    }
}

extension GameAttributes.ContentState {
    fileprivate static var smiley: GameAttributes.ContentState {
		GameAttributes.ContentState(game: .random)
     }
     
     fileprivate static var starEyes: GameAttributes.ContentState {
		 GameAttributes.ContentState(game: .random)
     }
}

#Preview("Notification", as: .dynamicIsland(.expanded), using: GameAttributes.preview) {
   GameLiveActivity()
} contentStates: {
    GameAttributes.ContentState.smiley
    GameAttributes.ContentState.starEyes
}

private extension GameState {
	static var random: GameState {
		GameState(homeScore: Int.random(in: 0 ..< 10), awayScore: Int.random(in: 0 ..< 10), scoringTeamName: "Kek", lastAction: UUID().uuidString)
	}
}
