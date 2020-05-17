//
//  ViewController.swift
//  RxKeychain
//
//  Created by ahmed.almasri@ymail.com on 05/13/2020.
//  Copyright (c) 2020 ahmed.almasri@ymail.com. All rights reserved.
//

import UIKit
import RxSwift
import RxKeychain
 
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		KeychainWrapper.standard.rx.set(key: "t", value: "aaa").asObservable().subscribe(onNext: { _ in
			
		}, onError: { (error) in
			
			}).dispose()
		
		KeychainWrapper.standard.rx.get(forKey: "t",type: String.self).asObservable().subscribe(onNext: { v in
				print(v)
			}, onError: { (error) in
				
				}).dispose()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

