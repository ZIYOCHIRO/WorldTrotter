//
//  WebViewController.swift
//  BigNerdRanchWorldTrotter
//
//  Created by 10.12 on 2018/9/10.
//  Copyright © 2018 10.12. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    // MARK: Properties
    var webView: WKWebView!
    
    // MARK: Life Cycle
    override func loadView() {
        // Creat a web view
        webView = WKWebView()

        webView.navigationDelegate = self
        
        // set it as *the* View of this viewController
        view = webView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("WebViewController load its view")
      
        let myURL = URL(string: "https://www.bignerdranch.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        webView.allowsBackForwardNavigationGestures = true
        
    }
    
   
}
