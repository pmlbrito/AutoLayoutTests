//
//  LayoutBaseViewController.swift
//  AutoLayoutTests
//
//  Created by Pedro Brito on 18/08/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import UIKit

class LayoutBaseViewController: UIViewController {
  
  @IBOutlet weak var dataLabel: UILabel!
  var dataObject: ContentPageModel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.dataLabel!.text = dataObject.headerTitle
  }
  
  
}
