//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import SwiftUI

extension View {

  /// Adds an asynchronous task to perform before this view first appears.
  ///
  /// Use this modifier to perform an asynchronous task with a lifetime that matches that of the
  /// modified view. If the task doesn’t finish before SwiftUI removes the view or the view changes
  /// identity, SwiftUI cancels the task.
  /// Use the await keyword inside the task to wait for an asynchronous call to complete, or to wait
  /// on the values of an AsyncSequence instance.
  /// - Parameters:
  ///   - priority: The task priority to use when creating the asynchronous task. The default priority
  ///   is userInitiated.
  ///   - action: A closure that SwiftUI calls as an asynchronous task before the view first appears.
  ///   SwiftUI will automatically cancel the task at some point after the view disappears before the
  ///   action completes.
  /// - Returns: A view that runs the specified action asynchronously before the view appears.
  func firstTask(
    priority: TaskPriority = .userInitiated,
    action: @escaping () async -> Void
  ) -> some View {
    modifier(FirstAppearTaskModifier(priority: priority, action: action))
  }
}

private struct FirstAppearTaskModifier: ViewModifier {

  /// The task priority to use when creating the asynchronous task.
  var priority: TaskPriority
  /// A closure that SwiftUI calls as an asynchronous task before the view first appears.
  var action: () async -> Void

  @State private var hasLoaded = false

  func body(content: Content) -> some View {

    content.task(priority: priority) {
      guard hasLoaded == false else { return }
      hasLoaded = true
      await action()
    }
  }
}
