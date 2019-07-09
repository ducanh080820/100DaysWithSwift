//
//  UserProfileViewModel.swift
//  StartMVVM
//
//  Created by DSCO on 7/9/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import Bond
import ReactiveKit

class UserProfileViewModel {
    let refreshing = Observable<Bool>(false)
    let username = Observable<String>("")
    let photos = Observable<[Photos]>([])
    
    private let userViewModel: UserViewModel
    private let photosViewModel: PhotosViewModel
    
    init(userManager: UserManager, photoManager: PhotoManager) {
        userViewModel = UserViewModel(manager: userManager)
        photosViewModel = PhotosViewModel(manager: photoManager)
        
        userViewModel.username.bind(to: username)
        photosViewModel.photos.bind(to: photos)
        combineLatest(userViewModel.refreshing, photosViewModel.refreshing)
            .map { $0 || $1 }
            .bind(to: refreshing)
    }
    
    func fetch() {
        userViewModel.fetch()
        photosViewModel.fetch()
    }
}

class UserViewModel {
    let refreshing = Observable<Bool>(false)
    let username = Observable<String>("")
    
    func fetch() {
        refreshing.value = true
        man ager.fetch(user: id) { [weak self] (user, error) in
            self?.username.value = "@" + user.username
            self?.refreshing.value = false
        }
    }
}

class PhotosViewModel {
    let refreshing = Observable<Bool>(false)
    let photos = Observable<[Photo]>([])
    
    func fetch() {
        refreshing.value = true
        manager.fetch(for user: id) { [weak self] (photos, error) in
            self?.photos.value = photos ?? []
            self?.refreshing.value = false
        }
    }
}
