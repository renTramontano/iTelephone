//
//  DetailFavouritesTableViewController.swift
//  AppTelephone
//
//  Created by Renato Tramontano on 24/07/18.
//  Copyright © 2018 Renato Tramontano. All rights reserved.
//

import UIKit

class DetailFavouritesTableViewController: UIViewController {

    @IBOutlet var containerView: UIView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var viewOfTable: UIView!
    @IBOutlet var heightTContainerView: NSLayoutConstraint!
    @IBOutlet var topContainerView: NSLayoutConstraint!
    @IBOutlet var heightTableView: NSLayoutConstraint!
    
    var imageProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        scrollView.delegate = self
        imageProfile = containerView.viewWithTag(1000) as! UIImageView
        imageProfile.layer.cornerRadius = imageProfile.frame.height/2
        imageProfile.clipsToBounds = true
        
        scrollView.layoutIfNeeded()
        heightTableView.constant = (viewOfTable.viewWithTag(1001) as! UITableView).contentSize.height + 52
    }
    
}

extension DetailFavouritesTableViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let scrollTest = topContainerView.constant - scrollView.contentOffset.y
        
        if scrollTest > -(containerView.frame.height/2) && scrollTest <= 0  {
            topContainerView.constant -= scrollView.contentOffset.y
            view.setNeedsLayout()
            scrollView.contentOffset.y = 0
        }
    }
    
}
