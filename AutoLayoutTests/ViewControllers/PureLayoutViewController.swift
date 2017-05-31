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
      bottomContainer = UIView.newAutoLayout();
      self.view.addSubview(bottomContainer)
      
      bottomView = UIView.newAutoLayout();
      bottomView.backgroundColor = UIColor.green
      self.bottomContainer.addSubview(bottomView)
      
      topRightView = UIView.newAutoLayout();
      topRightView.backgroundColor = UIColor.red
      self.view.addSubview(topRightView)
      
      topLeftView = UIView.newAutoLayout();
      topLeftView.backgroundColor = UIColor.blue
      self.view.addSubview(topLeftView)
    }
    
    self.view.setNeedsUpdateConstraints(); // bootstrap Auto Layout
  }
  
  override func updateViewConstraints() {

    let viewHeights = CGFloat(100.0);
    let viewOffset = CGFloat(10.0);
    
    if (!didSetupConstraints) {
      //extra view to help setup the layout
      bottomContainer.autoMatch(.height, to: .height, of: self.view, withMultiplier: 0.5);
      bottomContainer.autoPinEdge(toSuperviewEdge: .leading);
      bottomContainer.autoPinEdge(toSuperviewEdge: .trailing);
      bottomContainer.autoPinEdge(toSuperviewEdge: .bottom);
      
      
      bottomView.autoSetDimension(.height, toSize: viewHeights); //heightConstraint3
      bottomView.autoMatch(.width, to: .width, of: self.bottomContainer, withMultiplier: 0.9); //widthConstraint3
      bottomView.autoAlignAxis(toSuperviewMarginAxis: .vertical); //horizontalConstraint3
      bottomView.autoPinEdge(toSuperviewEdge: .top, withInset: viewOffset); //verticalConstraint3 - using container view to help
      
      
      topRightView.autoSetDimension(.height, toSize: viewHeights); //heightConstraint
      topRightView.autoMatch(.width, to: .width, of: self.view, withMultiplier: 0.4); //widthConstraint
      topRightView.autoConstrainAttribute(.right, to: .right, of: self.bottomView); //horizontalConstraint
      topRightView.autoPinEdge(.bottom, to: .top, of: self.bottomContainer, withOffset: -viewOffset); //verticalConstraint
      
      
      topLeftView.autoSetDimension(.height, toSize: viewHeights); //heightConstraint2
      topLeftView.autoMatch(.width, to: .width, of: self.view, withMultiplier: 0.4); //widthConstraint2
      topLeftView.autoConstrainAttribute(.left, to: .left, of: self.bottomView); //horizontalConstraint2
      topLeftView.autoPinEdge(.bottom, to: .top, of: self.bottomContainer, withOffset: -viewOffset); //verticalConstraint2
      
      didSetupConstraints = true;
    }
    
    super.updateViewConstraints()
  }
}
