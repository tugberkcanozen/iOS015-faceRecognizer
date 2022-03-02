//
//  ViewController.swift
//  faceRecognizer
//
//  Created by Tuğberk Can Özen on 3.03.2022.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClicked(_ sender: Any) {
        
        let authContext = LAContext() // Cihaz FaceID destekliyor mu kontrol etmek için bu sınıfı ekliyoruz
        var error: NSError?
        
        // Burada biometric özelliğini kullanacağımızı belirtiyoruz ve eğer yapabiliyorsa perform segue ile ikinci sayfaya gönderiyoruz.
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is that you?") { success, error in
                if success == true {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                    
                } else { DispatchQueue.main.async {
                    self.textLabel.text = "Error !"
                    
                
                    }
                }
            }
        }
    }
}

