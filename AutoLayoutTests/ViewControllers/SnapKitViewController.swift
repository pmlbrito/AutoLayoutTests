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
    // Do any additional setup after loading the view, typically from a nib.
    self.setupViewLayout();
  }
  
  func setupViewLayout() {
    let viewHeights = CGFloat(100.0);
    let viewOffset = CGFloat(10.0);
    let viewInset = CGFloat(20.0);
    
    self.view.addSubview(self.bottomContainer);
    self.bottomContainer.snp_makeConstraints { make in
      make.height.equalTo(self.view).multipliedBy(0.5)
      make.width.equalTo(self.view)
      make.centerX.equalTo(self.view)
      make.bottom.equalTo(self.view);
    }
    
    bottomView.backgroundColor = UIColor.greenColor()
    self.bottomContainer.addSubview(self.bottomView);
    self.bottomView.snp_makeConstraints { make in
      make.height.equalTo(viewHeights) //heightConstraint3
      make.width.equalTo(self.view).multipliedBy(0.9) //widthConstraint3
      make.centerX.equalTo(self.view) //horizontalConstraint3
      make.top.equalTo(self.bottomContainer).offset(viewOffset)  //verticalConstraint3 - using container view to help
    }
    
    topRightView.backgroundColor = UIColor.redColor()
    self.view.addSubview(self.topRightView)
    self.topRightView.snp_makeConstraints { make in
      make.height.equalTo(viewHeights) //heightConstraint
      make.width.equalTo(self.view).multipliedBy(0.4) //widthConstraint
      make.right.equalTo(self.view).inset(viewInset) //horizontalConstraint
      make.bottom.equalTo(self.bottomContainer.snp_top).inset(-viewOffset) //verticalConstraint
    }
    
    topLeftView.backgroundColor = UIColor.blueColor()
    self.view.addSubview(self.topLeftView)
    self.topLeftView.snp_makeConstraints { make in
      make.height.equalTo(viewHeights) //heightConstraint2
      make.width.equalTo(self.view).multipliedBy(0.4) //widthConstraint2
      make.left.equalTo(self.view).inset(viewInset) //horizontalConstraint2
      make.bottom.equalTo(self.bottomContainer.snp_top).inset(-viewOffset) //verticalConstraint2
    }
    
    self.view.setNeedsUpdateConstraints(); // bootstrap Auto Layout
  }
}

