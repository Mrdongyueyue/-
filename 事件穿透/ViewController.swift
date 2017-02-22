//
//  ViewController.swift
//  事件穿透
//
//  Created by 董知樾 on 2017/2/22.
//  Copyright © 2017年 董知樾. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("\(NSStringFromClass(self.classForCoder))---touchesBegan")
    }

}

