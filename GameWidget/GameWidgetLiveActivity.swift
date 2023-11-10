//
//  GameWidgetLiveActivity.swift
//  GameWidget
//
//  Created by Alexander on 10.11.2023.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct GameWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct GameWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: GameWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension GameWidgetAttributes {
    fileprivate static var preview: GameWidgetAttributes {
        GameWidgetAttributes(name: "World")
    }
}

extension GameWidgetAttributes.ContentState {
    fileprivate static var smiley: GameWidgetAttributes.ContentState {
        GameWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: GameWidgetAttributes.ContentState {
         GameWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: GameWidgetAttributes.preview) {
   GameWidgetLiveActivity()
} contentStates: {
    GameWidgetAttributes.ContentState.smiley
    GameWidgetAttributes.ContentState.starEyes
}
