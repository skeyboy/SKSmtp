//
//  SKSmtp.swift
//  SKSmtp
//
//  Created by sk on 2018/10/18.
//

import Foundation
import Vapor
import SwiftSMTP
import SSLService

public typealias Progress = ((Mail, Error?) -> Void)?

public class SKSmtp : Service {
    fileprivate var smtp: SMTP?
    init(config: SKSmtpConfig) {
        self.smtp = SMTP.init(hostname: config.hostname, email: config.email, password: config.password, port: config.port, useTLS: config.useTLS, tlsConfiguration: config.tlsConfiguration, authMethods:config.authMethods, domainName: config.domainName, timeout: config.timeout)
    }
    
    /// Send an email.
    ///
    /// - Parameters:
    ///     - mail: `Mail` object to send.
    ///     - completion: Callback when sending finishes. `Error` is nil on success. (optional)
    public func send(_ mail: Mail, completion: ((Error?) -> Void)? = nil) {
        smtp?.send(mail, completion: completion)
    }
    public func send(_ mails: [Mail],
                     progress: Progress = nil,
                     completion: Completion = nil) {
        DispatchQueue.main.async {        
            self.smtp?.send(mails, progress: progress, completion: completion)
        }
    }
}
