//
//  ZKBaseViewController.swift
//  ZKBaseSwiftProject
//
//  Created by zkil on 2021/12/13.
//  Copyright © 2021 吴泽凯. All rights reserved.
//

import UIKit
import RxSwift

protocol ZKBaseViewControllerProtocol {
    func initSubView()
    func layoutSubView()
    func bindViewModel()
}

class ZKBaseViewController: UIViewController, ZKBaseViewControllerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.initSubView()
        self.layoutSubView()
        self.bindViewModel()
    }
    
    
    
    
    func initSubView() {
        
    }
    
    func layoutSubView() {
        
    }
    
    func bindViewModel() {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
