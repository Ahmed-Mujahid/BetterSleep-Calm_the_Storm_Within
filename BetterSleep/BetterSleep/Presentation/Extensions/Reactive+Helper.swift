//
//  Reactive+Helper.swift
//  KSC
//
//  Created by developer on 18/05/2021.
//

import Foundation
import RxSwift
import RxCocoa
import MBProgressHUD

extension Reactive where Base: UIView {
    // Custom binding for HUD
    public var isShowHUD: Binder<Bool> {
        return Binder<Bool>.init(base.self, scheduler: MainScheduler.instance) { (view, isLoading) in
            if isLoading {
                MBProgressHUD.showAdded(to: view, animated: true)
            } else {
                MBProgressHUD.hide(for: view, animated: true)
            }
        }
    }
}

extension RxSwift.ObservableType where Element == Bool {
    func toggle() -> Observable<Bool> {
        self.map { !$0 }
    }
}
