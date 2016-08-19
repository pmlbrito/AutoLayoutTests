//
//  ContentPageModel.swift
//  AutoLayoutTests
//
//  Created by Pedro Brito on 18/08/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import Foundation

enum LayoutViewControllerTypes: String {
  case NSLayoutConstraints = "NSLayoutConstraintsViewController"
  case PureLayout = "PureLayoutViewController"
  case SnapKit = "SnapKitViewController"
}

struct ContentPageModel {
  var headerTitle: String!;
  var viewController: LayoutViewControllerTypes!;
}
