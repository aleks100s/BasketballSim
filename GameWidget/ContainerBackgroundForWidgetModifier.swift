//
//  ContainerBackgroundForWidgetModifier.swift
//  BasketballSim
//
//  Created by Alexander on 10.11.2023.
//

import SwiftUI

struct ContainerBackgroundForWidgetModifier<Background>: ViewModifier where Background: View {
	let background: () -> Background
	
	func body(content: Content) -> some View {
		if #available(iOSApplicationExtension 17.0, *) {
			content
				.containerBackground(for: .widget) {
					background()
				}
		} else {
			ZStack {
				background()
				content
					.padding()
			}
		}
	}
}

extension View {
	public func containerBackgroundForWidget<Background>(@ViewBuilder background: @escaping () -> Background) -> some View where Background: View {
		modifier(ContainerBackgroundForWidgetModifier(background: background))
	}
}
