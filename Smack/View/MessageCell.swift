//
//  MessageCell.swift
//  Smack
//
//  Created by user on 06.08.2018.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var userImg: CircleImage!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var messageBodyLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func comfigureCell(message: Message) {
        messageBodyLbl.text = message.messageBody
        userNameLbl.text = message.userName
        guard let userAvatar = message.userAvatar else { return }
        userImg.image = UIImage(named: userAvatar)
        guard let userAvatarColor = message.userAvatarColor else { return }
        userImg.backgroundColor = UserDataService.instance.returnUIColor(components: userAvatarColor)
    }

}
