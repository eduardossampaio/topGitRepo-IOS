//
//  RepositoryListItem.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
import UIKit

class RepositoryListItem :UITableViewCell{
    var item: Repo!
    
    //    var userImage:UIImageView!
    
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
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    let descriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .left
        lbl.accessibilityIdentifier = "descriptionLabel"
        lbl.numberOfLines = 3
        return lbl
    }()
    
    let startIcon : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    let forkIcon : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    let starCounts : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let forkCount : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessibilityIdentifier = "RepositoryListItem"
        
        self.addSubview(profilePicture)
        self.addSubview(repositoryName)
        self.addSubview(userName)
        self.addSubview(descriptionLabel)
        self.addSubview(startIcon)
        self.addSubview(forkIcon)
        self.addSubview(starCounts)
        self.addSubview(forkCount)
        
        startIcon.image = UIImage(named: "icon_star")
        forkIcon.image = UIImage(named: "git_fork")
        
        profilePicture.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 64, height: 64, enableInsets: false)
        
        repositoryName.anchor(top: profilePicture.topAnchor, left: profilePicture.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        userName.anchor(top: repositoryName.bottomAnchor, left: profilePicture.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        descriptionLabel.anchor(top: profilePicture.bottomAnchor, left: profilePicture.leftAnchor, bottom: startIcon.topAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        startIcon.anchor(top:nil, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 32, height: 32, enableInsets: false)
        
        starCounts.anchor(top: startIcon.topAnchor, left: startIcon.rightAnchor, bottom: startIcon.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        forkIcon.anchor(top:nil, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 32, height: 32, enableInsets: false)
        
        forkCount.anchor(top: forkIcon.topAnchor, left: nil, bottom: forkIcon.bottomAnchor, right: forkIcon.leftAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        
        selectionStyle = .none
        
        
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func bindItem(_ repo:Repo){
        profilePicture.downloadImage(from: repo.authorProfilePictureUrl) { image in
            self.profilePicture.maskCircle(anyImage: image)
            self.profilePicture.layoutIfNeeded()
        }
        repositoryName.text = repo.name
        userName.text = repo.authorName
        descriptionLabel.text = repo.description
        starCounts.text = "\(repo.starCount)"
        forkCount.text = "\(repo.forkCount)"
        
        
    }
    
}

