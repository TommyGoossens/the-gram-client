//
//  AppState.swift
//  The Gram
//
//  Created by Tommy Goossens on 20/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//
import Foundation

final class Appstate: ObservableObject{
    @Published var isShowingNewPostView: Bool = true
    @Published var selectedTab: GramViewTabs = .profile
}
