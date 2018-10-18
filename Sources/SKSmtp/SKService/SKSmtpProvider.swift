//
//  SKSmtpProvider.swift
//  Hello
//
//  Created by sk on 2018/10/13.
//

import Foundation
import Vapor
import SwiftSMTP
import SSLService


 
public class SKSmtpProvider: Provider {
    public func register(_ services: inout Services) throws {
        
        services.register { (container) -> SKSmtp in
            let config = try! container.make(SKSmtpConfig.self)
            
            return SKSmtp.init(config: config)
        }
    }
    
    public func didBoot(_ container: Container) throws -> EventLoopFuture<Void> {
        let result = container.eventLoop.newPromise(Void.self)
        result.succeed()
        return result.futureResult
    }
    
    
}
