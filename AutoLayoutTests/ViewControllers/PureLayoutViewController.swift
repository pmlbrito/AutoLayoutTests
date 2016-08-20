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
      topRightView.autoConstrainAttribute(.Right, toAttribute: .Right, ofView: self.bottomView); //horizontalConstraint
      topRightView.autoPinEdge(.Bottom, toEdge: .Top, ofView: self.bottomContainer, withOffset: -viewOffset); //verticalConstraint
      
      
      topLeftView.autoSetDimension(.Height, toSize: viewHeights); //heightConstraint2
      topLeftView.autoMatchDimension(.Width, toDimension: .Width, ofView: self.view, withMultiplier: 0.4); //widthConstraint2
      topLeftView.autoConstrainAttribute(.Left, toAttribute: .Left, ofView: self.bottomView); //horizontalConstraint2
      topLeftView.autoPinEdge(.Bottom, toEdge: .Top, ofView: self.bottomContainer, withOffset: -viewOffset); //verticalConstraint2
      
      didSetupConstraints = true;
    }
    
    super.updateViewConstraints()
  }
}
