//
//  ScreenViewController.swift
//  LEDScreen
//
//  Created by Seokjune Hong on 2022/07/06.
//

import UIKit

class ScreenViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var textColorButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet var buttonList: [UIButton]!
    @IBOutlet weak var userView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userTextField.delegate = self
        
        designButton(sendButton, "전송", "빨리보내", .white)
        designButton(textColorButton, "색바꾸기", "빨리바꿔", .yellow)
        designTextField()
//        studyOutletCollection()
    }
    
    func designTextField() {
        userTextField.placeholder = "내용을 작성해주세요"
        userTextField.text = "안녕하세요"
        userTextField.keyboardType = .default
        userTextField.font = .systemFont(ofSize: 15)
        userTextField.borderStyle = .none
        userTextField.textColor = .blue
    }
    
    func designButton(_ buttonName: UIButton, _ buttonTitle: String, _ highlightedTitle: String, _ bgColor: UIColor) {
        buttonName.setTitle(buttonTitle, for: .normal)
        buttonName.setTitle(highlightedTitle, for: .highlighted)
        buttonName.backgroundColor = bgColor
        buttonName.layer.cornerRadius = 8
        buttonName.layer.borderColor = UIColor.black.cgColor
        buttonName.layer.borderWidth = 3
        buttonName.setTitleColor(.red, for: .normal)
        buttonName.setTitleColor(.blue, for: .highlighted)
    }
    
    func studyOutletCollection() {
        
        
        // 1. 반복문
        let buttonArray = [sendButton, textColorButton]

        for item in buttonArray {
            item?.backgroundColor = .white
            item?.layer.cornerRadius = 2
        }
        
        // 2. 아웃렛 컬렉션
        
        for item in buttonList {
            item.backgroundColor = .white
            item.layer.cornerRadius = 2
        }
    }
    
    
    @IBAction func sendButtonClicked(_ sender: UIButton) {
        resultLabel.text = userTextField.text
    }
    
//    var checkingHiddenView = false
    
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
//      키보드 숨기기
        view.endEditing(true)
        
//      View 숨기기
        if userView.isHidden == true {
            userView.isHidden = false
        } else {
            userView.isHidden = true
        }
        
//        if checkingHiddenView == true {
//            checkingHiddenView = false
//            userView.isHidden = false
//        } else {
//            checkingHiddenView = true
//            userView.isHidden = true
//        }
    }
    
    
    
//    키보드 return 버튼 클릭 시 키보드 숨기기 기능 function
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.userTextField {
            view.endEditing(true)
        }
        
        return true
    }

    
}
