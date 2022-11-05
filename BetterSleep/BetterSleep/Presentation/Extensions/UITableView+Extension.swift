//
//  UITableView+Extension.swift
//  Fitness
//
//  Created by Husnain Ali on 15/02/2021.
//

import Foundation
import UIKit
import RxSwift

extension UITableView {
    func confirm(_ view: UIViewController) {
        self.delegate = view as? UITableViewDelegate
//        self.dataSource = view as? UITableViewDataSource
        self.refreshControl?.tintColor = .clear
        self.refreshControl?.backgroundColor = .clear
    }
    
    func confirmRx(_ view: UIViewController, _ disposeBag: DisposeBag) {
        if let delegate = view as? UIScrollViewDelegate {
            self.rx.setDelegate(delegate)
                .disposed(by: disposeBag)
        }
        self.refreshControl?.tintColor = .clear
        self.refreshControl?.backgroundColor = .clear
    }
    
    func updateTable(_ isHideSeparation: Bool = true) {
        self.backgroundColor = .clear
        self.tableFooterView = UIView(frame: .zero)
        self.separatorStyle = isHideSeparation ? .none : .singleLine
        self.separatorColor = .black
    }
    
    func register(_ identifier: String) {
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
}
