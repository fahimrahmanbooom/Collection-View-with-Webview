//
//  ViewController.swift
//  Collection View
//
//  Created by Fahim Rahman on 26/11/19.
//  Copyright © 2019 Fahim Rahman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let homeModel: [HomeModel] = [
        HomeModel(socialImages: #imageLiteral(resourceName: "youtube-512"), socialLabels: "Youtube"),
        HomeModel(socialImages: #imageLiteral(resourceName: "mail"), socialLabels: "Gmail"),
        HomeModel(socialImages: #imageLiteral(resourceName: "linkedin-icon"), socialLabels: "Linkedin"),
        HomeModel(socialImages: #imageLiteral(resourceName: "twitterimg"), socialLabels: "Twitter"),
        HomeModel(socialImages: #imageLiteral(resourceName: "facebook-icon-round-png-5"), socialLabels: "Facebook")
    ]
    
    @IBOutlet weak var socialMediaCollectionView: UICollectionView!
    
    var webView = webTemplateViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        socialMediaCollectionView.delegate = self
        socialMediaCollectionView.dataSource = self
        settingSizeForCollection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return homeModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: SocialCollectionViewCell = socialMediaCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SocialCollectionViewCell
        
        cell.configure(model: homeModel[indexPath.row])
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.toTheWebView(_:)))
        cell.isUserInteractionEnabled = true
        cell.contentView.tag = indexPath.row
        cell.contentView.addGestureRecognizer(tapGestureRecognizer)
        
        return cell
    }
    
    func viewPusher() -> webTemplateViewController {
        webView = self.storyboard?.instantiateViewController(identifier: "webTemplateViewController") as! webTemplateViewController
        self.navigationController?.pushViewController(webView, animated: true)
        
        return webView
    }
    
    @objc func toTheWebView(_ sender: AnyObject) {
        webView = viewPusher()
        
        if sender.view.tag == 0 {
            webView.stringValue = "youtube"
            webView.titleValue = "Youtube"
        }
        if sender.view.tag == 1 {
            webView.stringValue = "gmail"
            webView.titleValue = "Gmail"
        }
        if sender.view.tag == 2 {
            webView.stringValue = "linkedin"
            webView.titleValue = "Linkedin"
        }
        if sender.view.tag == 3 {
            webView.stringValue = "twitter"
            webView.titleValue = "Twitter"
        }
        if sender.view.tag == 4 {
            webView.stringValue = "facebook"
            webView.titleValue = "Facebook"
        }
   }
    
    func settingSizeForCollection() {
        let itemSize = UIScreen.main.bounds.width / 2 - 2
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        socialMediaCollectionView.collectionViewLayout = layout
    }
}
