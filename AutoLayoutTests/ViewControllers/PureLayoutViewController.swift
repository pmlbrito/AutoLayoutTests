//
//  PureLayoutViewController.swift
//  AutoLayoutTests
//
//  Created by Pedro Brito on 13/08/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import PureLayout

class PureLayoutViewController: LayoutBaseViewController {
  
  var didSetupConstraints = false;
  
  var bottomContainer: UIView!;
  var bottomView: UIView!;
  var topRightView: UIView!;
  var topLeftView: UIView!;
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.setupViewLayout();
  }
  
  func setupViewLayout()
  {
    if (!didSetupConstraints) {
      bottomContainer = UIView.newAutoLayoutView();
      self.view.addSubview(bottomContainer)
      
      bottomView = UIView.newAutoLayoutView();
      bottomView.backgroundColor = UIColor.greenColor()
      self.bottomContainer.addSubview(bottomView)
      
      topRightView = UIView.newAutoLayoutView();
      topRightView.backgroundColor = UIColor.redColor()
      self.view.addSubview(topRightView)
      
      topLeftView = UIView.newAutoLayoutView();
      topLeftView.backgroundColor = UIColor.blueColor()
      self.view.addSubview(topLeftView)
    }
    
    self.view.setNeedsUpdateConstraints(); // bootstrap Auto Layout
  }
  
  override func updateViewConstraints() {

    let viewHeights = CGFloat(100.0);
    let viewOffset = CGFloat(10.0);
    let viewInset = CGFloat(20.0);
    
    if (!didSetupConstraints) {
      //extra view to help setup the layout
      bottomContainer.autoMatchDimension(.Height, toDimension: .Height, ofView: self.view, withMultiplier: 0.5);
      bottomContainer.autoPinEdgeToSuperviewEdge(.Leading);
      bottomContainer.autoPinEdgeToSuperviewEdge(.Trailing);
      bottomContainer.autoPinEdgeToSuperviewEdge(.Bottom);
      
      
      bottomView.autoSetDimension(.Height, toSize: viewHeights); //heightConstraint3
      bottomView.autoMatchDimension(.Width, toDimension: .Width, ofView: self.bottomContainer, withMultiplier: 0.9); //widthConstraint3
      bottomView.autoAlignAxisToSuperviewMarginAxis(.Vertical); //horizontalConstraint3
      bottomView.autoPinEdgeToSuperviewEdge(.Top, withInset: viewOffset); //verticalConstraint3 - using container view to help
      
      
      topRightView.autoSetDimension(.Height, toSize: viewHeights); //heightConstraint
      topRightView.autoMatchDimension(.Width, toDimension: .Width, ofView: self.view, withMultiplier: 0.4); //widthConstraint
      topRightView.autoPinEdgeToSuperviewEdge(.Trailing, withInset: viewInset); //horizontalConstraint
      topRightView.autoPinEdge(.Bottom, toEdge: .Top, ofView: self.bottomContainer, withOffset: -viewOffset); //verticalConstraint
      
      
      topLeftView.autoSetDimension(.Height, toSize: viewHeights); //heightConstraint2
      topLeftView.autoMatchDimension(.Width, toDimension: .Width, ofView: self.view, withMultiplier: 0.4); //widthConstraint2
      topLeftView.autoPinEdgeToSuperviewEdge(.Leading, withInset: viewInset); //horizontalConstraint2
      topLeftView.autoPinEdge(.Bottom, toEdge: .Top, ofView: self.bottomContainer, withOffset: -viewOffset); //verticalConstraint2
      
      didSetupConstraints = true;
    }
    
    super.updateViewConstraints()
  }
}
