//
//  ViewController.swift
//  quoteApp
//
//  Created by yangpeng on 2017/9/20.
//  Copyright © 2017年 yangpeng. All rights reserved.
//

import UIKit
import WebKit
import AdSupport

class ViewController: UIViewController, WKScriptMessageHandler{
    
    var theWebView:WKWebView?
    
    override func viewDidLoad() {
        

        super.viewDidLoad()
        let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        //方式一加载ios端的html 然后用ios的html去加载
//        let path = Bundle.main.path(forResource: "index", ofType: ".html",
//                                    inDirectory: "HTML5")
//        let url = URL(fileURLWithPath:path!)
        
        //方式二直接制定url加载  ？ ？？ as as？ as！!  
        //let url = URL(string:"http://219.239.36.32:8080/ydbjq/login?deviceType=1&imei_idfa="+idfa);
        //let url = URL(string:"https://218.22.5.186:58443/mobileQuote");
        let url = URL(string:"https://qcxbjq.xyz:58443/mobileQuote?deviceType=1&imei_idfa="+idfa);
        //let url = URL(string:"http://192.168.63.133:8080/biweb/login?deviceType=1&imei_idfa="+idfa);
        //let url = URL(string:"https://www.qcxbjq.xyz");
        let request = URLRequest(url:url!)
        
        let theConfiguration = WKWebViewConfiguration()
        theConfiguration.userContentController.add(self, name: "interOp")
        
        let frame = CGRect(x:0, y:0, width:UIScreen.main.bounds.width,
                           height:UIScreen.main.bounds.height)
        theWebView = WKWebView(frame:frame, configuration: theConfiguration)
        theWebView!.scrollView.bounces = false
        theWebView!.load(request)
        self.view.addSubview(theWebView!)

        Thread.sleep(forTimeInterval: 1.5)
    }

    func userContentController(_ userContentController:WKUserContentController,
                               didReceive message: WKScriptMessage) {
        print(message.body)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

