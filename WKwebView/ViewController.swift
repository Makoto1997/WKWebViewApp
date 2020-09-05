//
//  ViewController.swift
//  WKwebView
//
//  Created by 田中誠 on 2020/08/13.
//  Copyright © 2020 田中誠. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {

    var webView = WKWebView()
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet var toolBar: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.frame = CGRect(x: 0, y: toolBar.frame.size.height, width: view.frame.size.height, height: view.frame.size.height - toolBar.frame.size.height*2)
        view.addSubview(webView)
        
        
        webView.navigationDelegate = self
        let url = URL(string: "https://www.yahoo.co.jp/")
        let request = URLRequest(url: url!)
        webView.load(request)
        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {

        }
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        print("読み込み開始")
        indicator.startAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        print("ロード完了")
        
        indicator.stopAnimating()
        
    }

    @IBAction func go(_ sender: Any) {
        
        webView.goForward()
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        webView.goBack()
        
    }
    
    
}

