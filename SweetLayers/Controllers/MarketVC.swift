//
//  MarketVC.swift
//  SweetLayers
//
//  Created by 1 on 17/01/25.
//

import UIKit

class MarketVC: UIViewController {
    @IBOutlet weak var coinLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinLabel.text = "\(UserDataConfiguration.shared.getCoins())"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SoundManager.shared.stopBackgroundMusic()
        SoundManager.shared.playMarketMusic()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        SoundManager.shared.playBackgroundMusic()
        SoundManager.shared.stopMarketMusic()
    }
    
    @IBAction func xTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func infoGotTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "InfoVC") as! InfoVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func buyBlowerButton(_ sender: UIButton) {
        if UserDataConfiguration.shared.getCoins() >= 30 {
            let blowerKey = UserDataConfiguration.shared.blower
            UserDataConfiguration.shared.updateValues(key: blowerKey,
                                                      value: (UserDataConfiguration.shared.getValueOfKey(key: blowerKey) as! Int) + 1)
            UserDataConfiguration.shared.updateValues(key: UserDataConfiguration.shared.coins, value: UserDataConfiguration.shared.getCoins() - 30)
            coinLabel.text = "\(UserDataConfiguration.shared.getCoins())"
        }
    }
    
    @IBAction func buyTimerButton(_ sender: Any) {
        if UserDataConfiguration.shared.getCoins() >= 30 {
            let timerKey = UserDataConfiguration.shared.timer
            UserDataConfiguration.shared.updateValues(key: timerKey,
                                                      value: (UserDataConfiguration.shared.getValueOfKey(key: timerKey) as! Int) + 1)
            UserDataConfiguration.shared.updateValues(key: UserDataConfiguration.shared.coins, value: UserDataConfiguration.shared.getCoins() - 30)
            coinLabel.text = "\(UserDataConfiguration.shared.getCoins())"
        }
    }
}
