//
//  ViewController.swift
//  ShowActiveInLabel
//
//  Created by 陳昶安 on 2016/11/20.
//  Copyright © 2016年 ANAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activeNum = 0
    
    @IBOutlet weak var showActiveLabel: UILabel!
    
    @IBOutlet weak var showActiveText: UILabel!
    func sayGoodBye(noti:Notification) {
        
        activeNum -= 1
        showActiveLabel.text = "\(activeNum)"
        showActiveText.text = "現在是app進入背景時的狀態，會將上列數字-1"
        print("sayGoodBye from \(noti)")
        
    }
    
    func sayHi(noti:Notification) {
        
        activeNum += 2
        showActiveLabel.text = "\(activeNum)"
        showActiveText.text = "現在是app由背景回到前景時的狀態，會將上列數字+2"
        
        print("sayHi from \(noti)")
        
    }
    
    func addObserver(_ observer: Any, selector aSelector:
        Selector, name aName: NSNotification.Name?, object
        anObject: Any?) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        showActiveLabel.text = "\(activeNum)"
        
        showActiveText.text = "現在是剛進入app時的狀態，預設值為0"
        
        NotificationCenter.default.addObserver(self, selector:
            #selector(ViewController.sayGoodBye(noti:)), name:
            Notification.Name.UIApplicationDidEnterBackground, object: nil)
        
        NotificationCenter.default.addObserver(self, selector:
            #selector(ViewController.sayHi(noti:)), name:
            Notification.Name.UIApplicationWillEnterForeground, object: nil)
        
        print("viewDidLoad")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        print("didReceiveMemoryWarning")
    }


}

