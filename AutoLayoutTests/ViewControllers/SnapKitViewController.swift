//
//  SnapKitViewController.swift
//  AutoLayoutTests
//
//  Created by Pedro Brito on 19/08/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import SnapKit

class SnapKitViewController: LayoutBaseViewController {
  
  
  lazy var bottomContainer = UIView();
  lazy var bottomView = UIView();
  lazy var topRightView = UIView();
  lazy var topLeftView = UIView();
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupViewLayout();
  }
  
  //View placement:
  //Bottom Green View has:
  //- width of 90% of the screen width -> widthConstraint3
  //- fixed height of 100pt -> heightConstraint3
  //- view center matching the horizontal center of the screen -> horizontalConstraint3
  //- top matching the vertical center of the screen with 10pt offset -> verticalConstraint3
  
  //Top Right Red View has:
  //- width of 40% of the screen width -> widthConstraint
  //- fixed height of 100pt -> heightConstraint
  //- right margin matching bottom green view right margin -> horizontalConstraint
  //- bottom matching the vertical center of the screen with 10pt offset -> verticalConstraint
  
  //Top Left Blue View has:
  //- width of 40% of the screen width -> widthConstraint2
  //- fixed height of 100pt -> heightConstraint2
  //- left margin matching bottom green view left margin -> horizontalConstraint2
  //- bottom matching the vertical center of the screen with 10pt offset -> verticalConstraint2
  
  //MARK: - Helper Methods
  
  func setupViewLayout() {
    let viewHeights = CGFloat(100.0);
    let viewOffset = CGFloat(10.0);
    
    self.view.addSubview(self.bottomContainer);
    self.bottomContainer.snp_makeConstraints { make in
      make.height.equalTo(self.view).multipliedBy(0.5)
      make.width.equalTo(self.view)
      make.centerX.equalTo(self.view)
      make.bottom.equalTo(self.view);
    }
    
    bottomView.backgroundColor = UIColor.green
    self.bottomContainer.addSubview(self.bottomView);
    self.bottomView.snp_makeConstraints { make in
      make.height.equalTo(viewHeights) //heightConstraint3
      make.width.equalTo(self.view).multipliedBy(0.9) //widthConstraint3
      make.centerX.equalTo(self.view) //horizontalConstraint3
      make.top.equalTo(self.bottomContainer).offset(viewOffset)  //verticalConstraint3 - using container view to help
    }
    
    topRightView.backgroundColor = UIColor.red
    self.view.addSubview(self.topRightView)
    self.topRightView.snp_makeConstraints { make in
      make.height.equalTo(viewHeights) //heightConstraint
      make.width.equalTo(self.view).multipliedBy(0.4) //widthConstraint
      make.right.equalTo(self.bottomView.snp_right) //horizontalConstraint
      make.bottom.equalTo(self.bottomContainer.snp_top).inset(-viewOffset) //verticalConstraint
    }
    
    topLeftView.backgroundColor = UIColor.blue
    self.view.addSubview(self.topLeftView)
    self.topLeftView.snp_makeConstraints { make in
      make.height.equalTo(viewHeights) //heightConstraint2
      make.width.equalTo(self.view).multipliedBy(0.4) //widthConstraint2
      make.left.equalTo(self.bottomView.snp_left) //horizontalConstraint2
      make.bottom.equalTo(self.bottomContainer.snp_top).inset(-viewOffset) //verticalConstraint2
    }
    
    self.view.setNeedsUpdateConstraints(); // bootstrap Auto Layout
  }
}

