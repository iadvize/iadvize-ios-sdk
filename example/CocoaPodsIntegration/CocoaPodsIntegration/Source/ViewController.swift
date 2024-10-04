//
//  ViewController.swift
//  CocoaPodsIntegration
//
//  Created by Alexandre Karst on 18/09/2018.
//  Copyright © 2018 iAdvize. All rights reserved.
//

import UIKit
import IAdvizeConversationSDK

enum ChatButtonType: Int {
    case `default` = 0
    case custom = 1
}

class ViewController: UIViewController {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var chatButtonSegmentedControl: UISegmentedControl!

    var chatButtonType: ChatButtonType = .default {
        didSet {
            switch chatButtonType {
            case .`default`:
                IAdvizeSDK.shared.chatboxController.useDefaultFloatingButton = true
                needHelpButton.isHidden = true
            case .custom:
                IAdvizeSDK.shared.chatboxController.useDefaultFloatingButton = false
                needHelpButton.isHidden = false
            }
        }
    }
    
    var isActiveTargetingRuleAvailable: Bool = false {
        didSet {
            needHelpButton.isEnabled = isActiveTargetingRuleAvailable
        }
    }
    
    @IBOutlet weak var needHelpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        IAdvizeSDK.shared.targetingController.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionSwapChatButton(_ sender: Any) {
        guard let chatButtonType = ChatButtonType(rawValue: chatButtonSegmentedControl.selectedSegmentIndex) else { return }
        self.chatButtonType = chatButtonType
    }

    @IBAction func actionNeedHelp(_ sender: Any) {
        IAdvizeSDK.shared.chatboxController.presentChatbox()
    }
}

extension ViewController: TargetingControllerDelegate {
    func activeTargetingRuleAvailabilityDidUpdate(isActiveTargetingRuleAvailable: Bool) {
        self.isActiveTargetingRuleAvailable = isActiveTargetingRuleAvailable
    }

    func activeTargetingRuleDidFailToUpdate(error: IAdvizeConversationSDK.TargetingError) {
        print("Active targeting rule update failed")
    }
}
