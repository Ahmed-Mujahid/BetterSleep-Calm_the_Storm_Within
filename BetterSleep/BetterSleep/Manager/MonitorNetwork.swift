//
//  MonitorNetwork.swift
//  BetterSleep
//
//  Created by Ahmed Mujahid on 06/07/2023.
//

import Foundation
import Network

class MonitorNetwork {
    
    static let shared = MonitorNetwork()
    
    var monitor = NWPathMonitor()
    
    /// Checks if network is available
    /// - Parameters:
    ///   - observe: to check every time
    ///   - completionHandler: completionHandler for returning bool for success
    func Connection(observe: Bool, completionHandler: @escaping (_ isConnected: Bool?) -> Void) {
        monitor.pathUpdateHandler = { path in
            
            if path.status == .satisfied {
                completionHandler(_: true)
            } else {
                completionHandler(_: false)
            }
            
            if !observe {
                self.monitor.pathUpdateHandler = nil
            }
        }
       
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
}
