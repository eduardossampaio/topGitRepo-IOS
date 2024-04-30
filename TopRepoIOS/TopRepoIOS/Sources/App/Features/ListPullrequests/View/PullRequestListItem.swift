//
//  PullRequestListItem.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 30/04/24.
//

import Foundation
import UIKit
class PullRequestListItem : UITableViewCell{
    var item: Repo!
    
    let profilePicture : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    let repositoryName : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    let userName : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let dateLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    let descriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 12)
        
        lbl.numberOfLines = 0
        return lbl
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(profilePicture)
        self.addSubview(repositoryName)
        self.addSubview(userName)
        self.addSubview(dateLabel)
        self.addSubview(descriptionLabel)
        
        profilePicture.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 64, height: 64, enableInsets: false)
        
        userName.anchor(top: profilePicture.bottomAnchor,left: profilePicture.leftAnchor,bottom: nil,right: profilePicture.rightAnchor)
        
        repositoryName.anchor(top: profilePicture.topAnchor,left: profilePicture.rightAnchor,bottom: nil,
        right: rightAnchor)
        

        dateLabel.anchor(top: repositoryName.bottomAnchor,left: nil,bottom:nil,right: rightAnchor, paddingTop: 10,paddingLeft: 0,paddingRight: 10)
        
        
        descriptionLabel.anchor(top: profilePicture.bottomAnchor, left: repositoryName.leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        repositoryName.setContentHuggingPriority(.defaultHigh, for: .vertical)            
        selectionStyle = .none
        
        userName.backgroundColor = UIColor.gray
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func bindItem(_ pullRequest : PullRequest){
        profilePicture.downloadImage(from: pullRequest.authorProfilePictureUrl) { image in
            self.profilePicture.maskCircle(anyImage: image)
            self.profilePicture.layoutIfNeeded()
        }
        repositoryName.text = pullRequest.title
        userName.text = pullRequest.authorName
        descriptionLabel.text = pullRequest.body
        dateLabel.text = "22/04/2024"
    }
    
}


