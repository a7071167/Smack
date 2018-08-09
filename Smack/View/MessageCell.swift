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
        
        guard var isoDate = message.timeStamp else { return }
        let endIndex = isoDate.index(isoDate.endIndex, offsetBy: -5)
        
        isoDate = isoDate.substring(to: endIndex)
        
        let isoFormatter = ISO8601DateFormatter()
        let chatDate = isoFormatter.date(from: isoDate.appending("Z"))
        
        let newFormatter = DateFormatter()
        newFormatter.dateFormat = "MMM d, h:mm"
        
        if let finalDate = chatDate {
            let finalDate = newFormatter.string(from: finalDate)
            timeStamp.text = finalDate
        }
    }

}
