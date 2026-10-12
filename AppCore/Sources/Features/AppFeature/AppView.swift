//
//  AppView.swift
//  Omoide
//
//  Created by Ikufumi Mitsuyu on 2026/10/10.
//

import SwiftUI
import UI

public struct AppView: View {
  // MARK: - Initialize
  public init() {}
  // MARK: - Body
  public var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(Color(.textPrimary))
      Text("Hello, world!")
    }
    .padding()
  }
}

#Preview {
  AppView()
}
