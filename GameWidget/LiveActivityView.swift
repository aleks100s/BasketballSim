//
//  LiveActivityView.swift
//  GameWidgetExtension
//
//  Created by Alexander on 10.11.2023.
//

import SwiftUI

struct LiveActivityView: View {
	let attributes: GameAttributes
	let state: GameState
	
    var body: some View {
		ZStack {
			Image("activity-background")
				.resizable()
				.aspectRatio(contentMode: .fill)
				.overlay {
					ContainerRelativeShape()
						.fill(.black.opacity(0.3).gradient)
				}
			
			VStack(spacing: 12) {
				HStack {
					Image(attributes.homeTeam)
						.teamLogoModifier(frame: 60)
					
					Text("\(state.homeScore)")
						.font(.system(size: 40, weight: .bold))
						.foregroundStyle(.white.opacity(0.9))
					
					Spacer()
					
					Image(attributes.awayTeam)
						.teamLogoModifier(frame: 60)
					
					Text("\(state.awayScore)")
						.font(.system(size: 40, weight: .bold))
						.foregroundStyle(.black.opacity(0.8))
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
		}
    }
}
