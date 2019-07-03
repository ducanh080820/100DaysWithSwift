//
//  WedViewController.swift
//  EarthQuakeDecoder
//
//  Created by DSCO on 7/3/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit
import WebKit

class WedViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var webView: WKWebView!
    
    var dataUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if dataUrl != nil {
            guard let url = URL(string: dataUrl!) else { return  }
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true

        }
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
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
