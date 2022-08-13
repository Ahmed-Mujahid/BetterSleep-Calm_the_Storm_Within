//
//  RxArray.swift
//  KSC
//
//  Created by developer on 18/05/2021.
//

import Foundation
import RxSwift
import RxCocoa

struct RxArray<T: Hashable> {
    
    private let storage: BehaviorRelay<[T]>
    private let lock = NSRecursiveLock()
    
    var items: Observable<[T]> {
        return storage.asObservable()
    }
    
    var count: Observable<Int> {
        return storage.map { $0.count }
    }
    
    init(elements: [T] = []) {
        storage = BehaviorRelay(value: elements)
    }
    
    func append(_ element: T) {
        lock.lock(); defer { lock.unlock() }
        storage.accept(storage.value + [element])
    }
    
    func removeFirst(_ element: T) {
        lock.lock(); defer { lock.unlock() }
        
        var items = storage.value
        guard let idx = items.firstIndex(of: element) else { return }
        
        items.remove(at: idx)
        storage.accept(items)
    }
    
    func removeAll(_ element: T) {
        lock.lock(); defer { lock.unlock() }
        storage.accept(storage.value.filter { $0 != element })
    }
}
