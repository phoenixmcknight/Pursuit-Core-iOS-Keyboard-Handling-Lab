//
//  firstPageVC.swift
//  keyboardHandlingLab
//
//  Created by Phoenix McKnight on 10/17/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import Foundation
import UIKit

class CompanyViewControlller:UIViewController {
  
    lazy var companyLabel: UILabel = {
        let label = UILabel()
        label.text = "Phoenix Industries"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        return label
    }()

    lazy var companyImage:UIImageView = {
        let image = UIImageView()
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(touchGestureOne)
        
        image.image = UIImage(named: "maxresdefault")
        return image
    }()

    lazy var touchGestureOne:UITapGestureRecognizer = {
        let touch = UITapGestureRecognizer()
        touch.addTarget(self, action: #selector(tap))
        return touch
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        addToSubView()
               setUpLabel()
               setUpImageConstraints()
        
    }
    override func viewWillLayoutSubviews() {
       
    }
    @objc func tap() {
        print("tap")
        navigationController?.pushViewController(ViewController(), animated: true)
    }
    func setUpLabel() {
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 50).isActive = true
        companyLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        companyLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
    }
    
    func setUpImageConstraints() {
        companyImage.translatesAutoresizingMaskIntoConstraints = false
        companyImage.topAnchor.constraint(equalTo: companyLabel.bottomAnchor).isActive = true
        companyImage.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
               companyImage.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        companyImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func addToSubView() {
        self.view.addSubview(companyLabel)
        self.view.addSubview(companyImage)
    }
}
