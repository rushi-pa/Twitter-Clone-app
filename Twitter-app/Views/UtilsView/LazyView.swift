//
//  LazyView.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-09-05.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}

