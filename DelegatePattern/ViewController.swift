//
//  ViewController.swift
//  DelegatePattern
//
//  Created by Luca Berardinelli on 26/08/22.
//

import UIKit

// ********************+ EXAMPLE 1

protocol DelegateProtocol {
    func printThisString(string: String)
}

class ViewController: UIViewController, DelegateProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        perform(#selector(nextVC), with: nil, afterDelay: 2)
    }
    
    @objc func nextVC(){
        let vc2 = ViewController2()
        vc2.delegate = self
        present(vc2, animated: true, completion: nil)
    }
    
    func printThisString(string: String) {
       print(string)
    }
    
}

class ViewController2: ViewController {
    var delegate: DelegateProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        delegate?.printThisString(string: "string from controller 2")
    }
}

// ********************+ EXAMPLE 2

//class ViewController: UIViewController, NotificationSettingsViewDelegate {
//
//    private let notificationSettingsView = NotificationSettingsView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        notificationSettingsView.delegate = self
//        view.addSubview(notificationSettingsView)
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        notificationSettingsView.frame = CGRect(x: 10,
//                                                y: view.safeAreaInsets.top,
//                                                width: view.frame.size.width-20,
//                                                height: view.frame.size.height-view.safeAreaInsets.top-view.safeAreaInsets.bottom)
//    }
//
//    func didTapEnableButton() {
//        let alert = UIAlertController(title: "Enable notifications", message: "Enable notifications", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
//        present(alert, animated: true, completion: nil)
//    }
//}
//
//protocol NotificationSettingsViewDelegate: AnyObject {
//    func didTapEnableButton()
//}
//
//class NotificationSettingsView: UIView {
//
//    weak var delegate: NotificationSettingsViewDelegate?
//
//    private let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "bell")
//        imageView.tintColor = .systemBlue
//
//        return imageView
//    }()
//
//    private let label: UILabel = {
//        let label = UILabel()
//        label.text = "To stay up-to-date enable Push Notifications"
//        label.textAlignment = .center
//
//        return label
//    }()
//
//    private let button: UIButton = {
//        let button = UIButton()
//        button.setTitle("Enable Push Notifications", for: .normal)
//        button.backgroundColor = .systemGreen
//        button.setTitleColor(.white, for: .normal)
//
//        return button
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        addSubview(imageView)
//        addSubview(label)
//        addSubview(button)
//        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//    }
//
//    @objc func didTapButton(){
//        delegate?.didTapEnableButton()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        let imageSize = bounds.size.width / 2
//        imageView.frame = CGRect(x: (bounds.size.width - imageSize)/2, y: 30, width: imageSize, height: imageSize)
//
//        label.frame = CGRect(x: 10, y: 30+imageSize+20, width: frame.size.width-20, height: 100)
//        button.frame = CGRect(x: 40, y: 160+imageSize+20, width: frame.size.width-80, height: 50)
//    }
//
//}
//
