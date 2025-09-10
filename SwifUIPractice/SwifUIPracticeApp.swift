//
//  SwifUIPracticeApp.swift
//  SwifUIPractice
//
//  Created by Roger Florat Gutierrez on 09/09/25.
//

import SwiftUI
import SwiftfulRouting

@main
struct SwifUIPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
        }
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
