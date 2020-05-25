//
//  Debouncer.swift
//  The Gram
//
//  Created by Tommy Goossens on 19/05/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import UIKit
import Foundation

class Debouncer {

    // MARK: - Properties
    private let queue = DispatchQueue.main
    private var workItem = DispatchWorkItem(block: {})
    private var interval: TimeInterval

    // MARK: - Initializer
    init(seconds: TimeInterval) {
        self.interval = seconds
    }

    // MARK: - Debouncing function
    func debounce(action: @escaping (() -> Void)) {
        workItem.cancel()
        workItem = DispatchWorkItem(block: { action() })
        queue.asyncAfter(deadline: .now() + interval, execute: workItem)
    }
}
