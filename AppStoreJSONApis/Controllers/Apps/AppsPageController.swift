//
//  AppsController.swift
//  AppStoreJSONApis
//
//  Created by kashee on 15/01/24.
//

import UIKit


class AppsPageController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let headerId = "headerId"
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: AppsGroupCell.identifier)
        
        // 1
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsPageHeader.identifier)
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperview()
        
        fetchData()
    }
    
    var editorChoiceGames: AppGroup?
    
    var socialApps = [SocialApp]()
    var groups = [AppGroup]()
    
    fileprivate func fetchData() {
        
        var group1: AppGroup?
        var group2: AppGroup?
        var group3: AppGroup?
        
        // help you sync your data fetches together
        let dispatchGroup = DispatchGroup()
        
        
        dispatchGroup.enter()
        Service.shared.fetchGames { (result: Result<AppGroup, Error>) in
            dispatchGroup.leave()
            print("Gone with games")
            switch result {
            case .success(let appGroup):
                group1 = appGroup
            case .failure(let error):
                print("Failed to fetch:", error)
            }
        }
        
        
        dispatchGroup.enter()
        Service.shared.fetchTopGrossing { (result: Result<AppGroup, Error>) in
            dispatchGroup.leave()
            print("Gone with grossing")
            switch result {
            case .success(let appGroup):
                group2 = appGroup
            case .failure(let error):
                print("Failed to fetch:", error)
            }
        }
        
        
        dispatchGroup.enter()
        Service.shared.fetchAppGroups(urlString: "https://rss.applemarketingtools.com/api/v2/gb/podcasts/top/10/podcasts.json") { (result: Result<AppGroup, Error>) in
            dispatchGroup.leave()
            print("Gone with podcasts")
            switch result {
            case .success(let appGroup):
                group3 = appGroup
            case .failure(let error):
                print("Failed to fetch:", error)
            }
        }
        
        
        dispatchGroup.enter()
        Service.shared.fetchSocialApps { (result: Result<[SocialApp], Error>) in
            dispatchGroup.leave()
            switch result {
            case .success(let apps):
                self.socialApps = apps
            case .failure(let error):
                print("Failed to fetch:", error)
            }
        }
        
        
        // completion
        dispatchGroup.notify(queue: .main) {
            print("Completed your dispatch group task")
            
            self.activityIndicatorView.stopAnimating()
            if let group = group1 {
                self.groups.append(group)
            }
            if let group = group2 {
                self.groups.append(group)
            }
            if let group = group3 {
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
        
    }
    
    // 2
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppsPageHeader.identifier, for: indexPath) as! AppsPageHeader
        header.appHeaderHorizontalController.socailApps = self.socialApps
        header.appHeaderHorizontalController.collectionView.reloadData()
        return header
    }
    
    // 3
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsGroupCell.identifier, for: indexPath) as! AppsGroupCell
        let appGroup = groups[indexPath.item]
        cell.titleLabel.text = appGroup.feed.title
        cell.horizontalController.appGroup = appGroup
        cell.horizontalController.collectionView.reloadData()
        cell.horizontalController.didSelectHandler = { [weak self] feedResult in
            let controller = AppDetailController(appId: feedResult.id)
            controller.navigationItem.title = feedResult.name
            self?.navigationController?.pushViewController(controller, animated: true)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }


}
