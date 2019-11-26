//
//  webTemplateViewController.swift
//  Collection View
//
//  Created by Fahim Rahman on 26/11/19.
//  Copyright © 2019 Fahim Rahman. All rights reserved.
//

import UIKit
import WebKit

class webTemplateViewController: UIViewController {

    var stringValue: String?
    var titleValue: String?
    
    @IBOutlet weak var webTemplate: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadForWebViewFromServer()
    }
    func loadForWebViewFromServer() {
    
    if stringValue == "facebook" {
        let url = URL(string: "https://www.facebook.com/")
        let request = URLRequest(url: url!)
        webTemplate.load(request)
    }
    if stringValue == "gmail" {
        let url = URL(string: "https://mail.google.com/")
        let request = URLRequest(url: url!)
        webTemplate.load(request)
    }
    if stringValue == "linkedin" {
        let url = URL(string: "https://www.linkedin.com/")
        let request = URLRequest(url: url!)
        webTemplate.load(request)
    }
    if stringValue == "twitter" {
        let url = URL(string: "https://twitter.com/")
        let request = URLRequest(url: url!)
        webTemplate.load(request)
    }
    if stringValue == "youtube" {
        let url = URL(string: "https://www.youtube.com/")
        let request = URLRequest(url: url!)
        webTemplate.load(request)
        }
    }
}
