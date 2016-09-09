//
//  ReviewViewController.swift
//  CocinaDominicana
//
//  Created by Juan Morillo on 25/8/16.
//  Copyright © 2016 JuanMorillios. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var bkgImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //Difuminar el color de la imagen de fon
        let blurEffect = UIBlurEffect(style: .dark)
        let blurBkgImageView = UIVisualEffectView(effect: blurEffect)
        bkgImageView.addSubview(blurBkgImageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  

}
