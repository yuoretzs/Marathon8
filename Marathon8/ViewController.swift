//
//  ViewController.swift
//  Marathon8
//
//  Created by юра on 22.03.23.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView = UIScrollView()
    var avatarImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let avatarImage = UIImage(systemName: "person.crop.circle.fill")
        avatarImageView = UIImageView(image: avatarImage)
        avatarImageView.frame = CGRect(x: view.frame.width - 50, y: -42, width: 36, height: 36)
        avatarImageView.tintColor = .gray
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        navigationItem.title = "Avatar"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.delegate = self
        view.addSubview(scrollView)
        
        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 2000))
        scrollView.addSubview(contentView)
        scrollView.contentSize = contentView.frame.size
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        guard let navigationBar = navigationController?.navigationBar else { return }
        for subview in navigationBar.subviews {
            let stringFromClass = NSStringFromClass(subview.classForCoder)
            print(stringFromClass)
            if stringFromClass.contains("UINavigationBarLargeTitleView"),
               !subview.subviews.contains(avatarImageView) {
                subview.addSubview(avatarImageView)
                NSLayoutConstraint.activate([
                    avatarImageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor,constant: -10),
                    avatarImageView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: -30),
                    avatarImageView.widthAnchor.constraint(equalToConstant: 36),
                    avatarImageView.heightAnchor.constraint(equalToConstant: 36)
                    
                ])
            }
        }
    }
}
