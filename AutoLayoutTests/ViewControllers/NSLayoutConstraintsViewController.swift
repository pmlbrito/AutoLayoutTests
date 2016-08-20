//
//  DataViewController.swift
//  AutoLayoutTests
//
//  Created by Pedro Brito on 13/08/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import UIKit

class NSLayoutConstraintsViewController: LayoutBaseViewController {

  
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
   
    
    let bottomView = UIView()
    bottomView.backgroundColor = UIColor.greenColor()
    bottomView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(bottomView)
    
    let widthConstraint3 = NSLayoutConstraint(item: bottomView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.9, constant: 0)
    view.addConstraint(widthConstraint3)
    
    let heightConstraint3 = NSLayoutConstraint(item: bottomView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: viewHeights)
    view.addConstraint(heightConstraint3)
    
    
    let horizontalConstraint3 = NSLayoutConstraint(item: bottomView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
    view.addConstraint(horizontalConstraint3)
    
    
    let verticalConstraint3 = NSLayoutConstraint(item: bottomView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: viewOffset)
    view.addConstraint(verticalConstraint3)
    
    
    let topRightView = UIView()
    topRightView.backgroundColor = UIColor.redColor()
    topRightView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(topRightView)
    
    let horizontalConstraint = NSLayoutConstraint(item: topRightView, attribute: NSLayoutAttribute.RightMargin, relatedBy: NSLayoutRelation.Equal, toItem: bottomView, attribute: NSLayoutAttribute.RightMargin, multiplier: 1, constant: 0)
    view.addConstraint(horizontalConstraint)
    
    let verticalConstraint = NSLayoutConstraint(item: topRightView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -viewOffset)
    view.addConstraint(verticalConstraint)
    
    let widthConstraint = NSLayoutConstraint(item: topRightView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.4, constant: 0)
    view.addConstraint(widthConstraint)
    
    let heightConstraint = NSLayoutConstraint(item: topRightView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: viewHeights)
    view.addConstraint(heightConstraint)
    
    let topLeftView = UIView()
    topLeftView.backgroundColor = UIColor.blueColor()
    topLeftView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(topLeftView)
    
    
    let horizontalConstraint2 = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.LeftMargin, relatedBy: NSLayoutRelation.Equal, toItem: bottomView, attribute: NSLayoutAttribute.LeftMargin, multiplier: 1, constant: 0)
    view.addConstraint(horizontalConstraint2)
    
    let verticalConstraint2 = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -viewOffset)
    view.addConstraint(verticalConstraint2)
    
    
    let widthConstraint2 = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.4, constant: 0)
    view.addConstraint(widthConstraint2)
    
    let heightConstraint2 = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: viewHeights)
    view.addConstraint(heightConstraint2)

  }
}

