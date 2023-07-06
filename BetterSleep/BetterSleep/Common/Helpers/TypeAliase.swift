//
//  TypeAliase.swift
//  BetterSleep
//
//  Created by developer on 14/08/2022.
//

import Foundation
import SwiftyJSON

typealias Params = [String: Any]
typealias GenericCompletion = () -> Void
typealias CompletionNetwork = (_ success: Bool, _ result: JSON) -> Void
typealias GenericNetworkCompletion = (_ success: Bool, _ message: String) -> Void
typealias GenericModelCompletion<Model> = (_ success: Bool, _ message: String, _ model: Model?) -> Void
