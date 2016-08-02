//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by jyotishankar sahoo on 02/08/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation
import UIKit
import WebKit

//Bronze Challenge
class WebViewController : UIViewController ,WKNavigationDelegate{
    
    var webView : WKWebView!
    override func loadView() {
        super.loadView()
        webView = WKWebView()
        webView.navigationDelegate = self
        webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.bignerdranch.com")!))
        webView.allowsBackForwardNavigationGestures = true
        view = webView
    }
}