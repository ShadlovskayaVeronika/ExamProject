//
//  CardView.swift
//  ExamProject
//
//  Created by Veronika Shadlovskaya on 05.08.2021.
//

import Foundation
import UIKit
import SnapKit

class CardView: UIView {
 
    let contactsTitle = UILabel()
    let phone = UILabel()
    let imageView = UIImageView()
    let twitterButton = UIButton()
    let facebookButton = UIButton()
    let instagramButton = UIButton()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
        configureConstraints()
      }
      
      required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
        configureConstraints()
      }
      
      private func configureContents() {
        self.backgroundColor = .white
       
        contactsTitle.text = "Contacts"
        imageView.image = UIImage(named: "defaultVenueImage")
        twitterButton.setImage(UIImage(named: "twitter"), for: .normal)
        facebookButton.setImage(UIImage(named: "facebook"), for: .normal)
        instagramButton.setImage(UIImage(named: "instagram"), for: .normal)
      
        configureButton(twitterButton)
        configureButton(facebookButton)
        configureButton(instagramButton)
        
        addSubview(self.contactsTitle)
        addSubview(self.phone)
        addSubview(self.imageView)
        addSubview(self.facebookButton)
        addSubview(self.instagramButton)
        addSubview(self.twitterButton)
      }
    
    private func configureConstraints() {
        imageView.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(100)
            make.centerX.equalToSuperview().inset(30)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(imageView.snp.width).multipliedBy(1.26)
        }
        contactsTitle.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).inset(-10)
        }
        phone.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(contactsTitle.snp.bottom).inset(-10)
        }
        twitterButton.snp.makeConstraints{ make in
            make.top.equalTo(phone.snp.bottom).inset(-20)
            make.leading.equalToSuperview().inset(30)
            make.width.height.equalTo(100)
        }
        facebookButton.snp.makeConstraints{ make in
            make.top.equalTo(phone.snp.bottom).inset(-20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        instagramButton.snp.makeConstraints{ make in
            make.top.equalTo(phone.snp.bottom).inset(-20)
            make.trailing.equalToSuperview().inset(30)
            make.width.height.equalTo(100)
        }
    }
    
    func configureButton(_ button: UIButton) {
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom:50, right: 25)
        button.titleEdgeInsets = UIEdgeInsets(top: 45, left:-55, bottom:0, right: 0)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Courier", size: 10)
    }
    
}
