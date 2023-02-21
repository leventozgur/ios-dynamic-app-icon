//
//  ViewController.swift
//  DynamicLogoApp
//
//  Created by Levent ÖZGÜR on 20.02.23.
//

import UIKit

class MainViewController: UIViewController {
    
    var counter: Int = 0
    let appIconManager: AppIconMamangerInterface = AppIconMamanger()

    private lazy var titleLbl: UILabel = {
        let tmp = UILabel()
        tmp.translatesAutoresizingMaskIntoConstraints = false
        tmp.text = "Dynamic App Icon"
        tmp.textColor = .black
        tmp.textAlignment = .center
        tmp.font = .boldSystemFont(ofSize: 30)
        return tmp
    }()
    
    private lazy var randomChangeIconBtn: UIButton = {
       let tmp = UIButton()
        tmp.translatesAutoresizingMaskIntoConstraints = false
        tmp.setTitle("Change App Icon", for: .normal)
        tmp.backgroundColor = .systemBlue
        tmp.setTitleColor(.white, for: .normal)
        tmp.layer.cornerRadius = 5
        tmp.layer.borderWidth = 1
        tmp.layer.borderColor = UIColor.systemBlue.cgColor
        tmp.contentEdgeInsets = .init(top: 10, left: 15, bottom: 10, right: 15)
        tmp.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        return tmp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private
extension MainViewController {
    func setupUI(){
        self.view.backgroundColor = .white
        self.view.addSubview(titleLbl)
        self.view.addSubview(randomChangeIconBtn)
        
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            randomChangeIconBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            randomChangeIconBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

@objc
extension MainViewController {
    private func btnTapped() {
        counter += 1
        
        switch (counter % 3) {
        case 0:
            appIconManager.changeAppIconAsDefault(complation: {})
        case 1:
            appIconManager.changeAppIcon(.appIcon2, complation: {})
        case 2:
            appIconManager.changeAppIcon(.appIcon3, complation: {})
        default:
            break
        }
    }
}

