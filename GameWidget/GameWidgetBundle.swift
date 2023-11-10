//
//  GameWidgetBundle.swift
//  GameWidget
//
//  Created by Alexander on 10.11.2023.
//

import WidgetKit
import SwiftUI

@main
struct GameWidgetBundle: WidgetBundle {
    var body: some Widget {
        GameWidget()
        GameWidgetLiveActivity()
    }
}
