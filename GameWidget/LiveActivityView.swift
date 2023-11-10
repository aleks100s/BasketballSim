//
//  LiveActivityView.swift
//  GameWidgetExtension
//
//  Created by Alexander on 10.11.2023.
//

import SwiftUI

struct LiveActivityView: View {
	@Environment(\.isActivityFullscreen) var isStandBy
	let attributes: GameAttributes
	let state: GameState
	
	var body: some View {
		ZStack {
			if !isStandBy {
				Image("activity-background")
					.resizable()
					.aspectRatio(contentMode: .fill)
					.overlay {
						ContainerRelativeShape()
							.fill(.black.opacity(0.3).gradient)
					}
			}
			VStack(spacing: 12) {
				HStack {
					Image(attributes.homeTeam)
						.teamLogoModifier(frame: 60)
					
					Text("\(state.homeScore)")
						.font(.system(size: 40, weight: .bold))
						.foregroundStyle(.white.opacity(0.9))
						.contentTransition(.numericText())
					
					Spacer()
					
					Image(attributes.awayTeam)
						.teamLogoModifier(frame: 60)
					
					Text("\(state.awayScore)")
						.font(.system(size: 40, weight: .bold))
						.foregroundStyle(isStandBy ? .white.opacity(0.9) : .black.opacity(0.8))
						.contentTransition(.numericText())
				}
				
				HStack {
					Image(state.scoringTeamName)
						.teamLogoModifier(frame: 20)
					
					Text(state.lastAction)
						.font(.callout)
						.fontWeight(.semibold)
						.foregroundStyle(.white.opacity(0.9))
				}
			}
			.padding()
		}
	}
}
