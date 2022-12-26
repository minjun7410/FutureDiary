//
//  ViewController.swift
//  FutureDiary
//
//  Created by 송민준 on 2022/12/25.
//

import UIKit
protocol SendDataDelegate{
    func receiveData(responce: String) -> Void
}
class MainViewController: UIViewController, SendDataDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreateSegue"{
            guard let vc = segue.destination as? CreateViewController else { return }
            vc.dataDelegate = self
        }
    }
    @IBAction func createButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "CreateSegue", sender: nil)
    }
    func receiveData(responce: String) {
        print("receive: \(responce)")
    }
}

