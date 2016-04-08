//
//  ViewController.swift
//  testevreflection
//
//  Created by appdev on 16/4/8.
//  Copyright © 2016年 opznet. All rights reserved.
//

import UIKit

class TestObj: EVObject{
    var name: String = "";
    var age: Int = 0
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let jsonstr = "{ \"name\": \"hello\",\"age\": 1 }"
        
        
        if let obj: TestObj? = TestObj(json: jsonstr) {
            print(obj)
        } else {
            print("fail to init")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

