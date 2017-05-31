//
//  ModelController.swift
//  AutoLayoutTests
//
//  Created by Pedro Brito on 13/08/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import UIKit

/*
 A controller object that manages a simple model.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */


class ModelController: NSObject, UIPageViewControllerDataSource {

  var pageData: [ContentPageModel] = []
  var pageDelegate: PageControlDelegate!;
  
  override init() {
      super.init()
    // Create the data model.
    pageData = [ContentPageModel(headerTitle: "NSAutoLayout Constraints View Controller", viewController: LayoutViewControllerTypes.NSLayoutConstraints),ContentPageModel(headerTitle: "PureLayout Constraints View Controller", viewController: LayoutViewControllerTypes.PureLayout),ContentPageModel(headerTitle: "SnapKit Constraints View Controller", viewController: LayoutViewControllerTypes.SnapKit)];
    
    self.pageDelegate?.setNumberOfPages(self.pageData.count);
  }

  func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> LayoutBaseViewController? {
    // Return the data view controller for the given index.
    if (self.pageData.count == 0) || (index >= self.pageData.count) {
        return nil
    }

    // Create a new view controller and pass suitable data.
    let dataViewController = self.getViewControllerInstanceForType(storyboard, type: (self.pageData[index]).viewController)
    dataViewController.dataObject = self.pageData[index]
    self.pageDelegate?.setCurrentPageNumber(index);
    return dataViewController
  }

  func indexOfViewController(_ viewController: LayoutBaseViewController) -> Int {
    // Return the index of the given data view controller.
    // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    var index: Int = 0;
    for model in self.pageData {
      if (model.headerTitle.caseInsensitiveCompare(viewController.dataObject.headerTitle) == ComparisonResult.orderedSame){
        return index;
      }
      index = index + 1 ;
    }
    return NSNotFound;
  }

  // MARK: - Page View Controller Data Source

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
      var index = self.indexOfViewController(viewController as! LayoutBaseViewController)
      if (index == 0) || (index == NSNotFound) {
          return nil
      }
      
      index -= 1
      return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
  }

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
      var index = self.indexOfViewController(viewController as! LayoutBaseViewController)
      if index == NSNotFound {
          return nil
      }
      
      index += 1
      if index == self.pageData.count {
          return nil
      }
      return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
  }
  
  //MARK: - Helper Methods
  
  func getViewControllerInstanceForType(_ storyboard: UIStoryboard, type: LayoutViewControllerTypes) -> LayoutBaseViewController {
  
    switch type{
    case .NSLayoutConstraints:
      let dataViewController = storyboard.instantiateViewController(withIdentifier: "NSLayoutConstraintsViewController") as! NSLayoutConstraintsViewController
      return dataViewController;
    case .PureLayout:
      let dataViewController = storyboard.instantiateViewController(withIdentifier: "PureLayoutViewController") as! PureLayoutViewController
      return dataViewController;
    case .SnapKit:
      let dataViewController = storyboard.instantiateViewController(withIdentifier: "SnapKitViewController") as! SnapKitViewController
      return dataViewController;
    
    }
  }
}

