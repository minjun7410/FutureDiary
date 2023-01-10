//
//  CreateViewController.swift
//  FutureDiary
//
//  Created by 송민준 on 2022/12/26.
//

import UIKit

class CreateViewController: UIViewController {
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var textEmotion: UITextField!
    @IBOutlet weak var textContent: UITextView!
    @IBOutlet weak var calendarSwitch: UISwitch!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imgInsertBtn: UIButton!
    
    var dataDelegate: SendDataDelegate?
    let imgPicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgPicker.sourceType = .photoLibrary
        self.imgPicker.allowsEditing = true
        self.imgPicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeButtonPushed(_ sender: UIButton) {
        guard let date = self.date?.date else {return}
        guard let content = self.textContent?.text else {return}
        let emotion:String? = self.textEmotion.text
        let doCalendar:Bool = self.calendarSwitch.isOn
        let imageData = self.imageView.image?.pngData()
        dataDelegate?.receiveData(date:date, emotion:emotion, content:content, doCalendar: doCalendar, imageData: imageData)
        dismiss(animated: true)
    }
    
    @IBAction func imgInsertBtnPushed(_ sender: Any) {
        imgPicker.sourceType = .photoLibrary
        imgPicker.delegate = self
        imageView.isHidden = false
        imgInsertBtn.isHidden = true
        present(imgPicker, animated: true)
    }
}
extension CreateViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.contentMode = .scaleAspectFit
            
            imageView.image = img
        }
        
        dismiss(animated: true)
    }
    
}
