// MIT License
//
// Copyright (c) 2022 Nikolay Pelevin
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit
import CoreData
import SwiftProtobuf
import SwiftOTP

// MARK: - Parser

extension GAuthSwiftParser {
    
    static func GetData(code: String) throws -> String {
        guard let url = URL(string:code) else {
            return "Error"
        }
        let data = url.params()
        return data["data"] as! String
    }
    
    static func deserialize(code: String) -> [MigrationPayload.OtpParameters] {
        let decoded = Data(base64Encoded: code)!
        do {
            let migration = try MigrationPayload(serializedData: decoded)
            //        print(Data(try migration.serializedData()).base64EncodedString())
            return migration.otpParameters
        } catch (_) {
            return []
        }
    }
    
}

// MARK: - URL

extension URL {
    func params() -> [String:Any] {
        var dict = [String:String]()
        
        if let components = URLComponents(url: self, resolvingAgainstBaseURL: true) {
            dict["host"] = components.host
            dict["path"] = components.path
            if let queryItems = components.queryItems {
                for item in queryItems {
                    dict[item.name] = item.value!
                }
            }
            return dict
        } else {
            return [:]
        }
    }
}

// MARK: - String

public extension String {
    
    var base64Decoded: String? {
        guard let decodedData = Data(base64Encoded: self) else { return nil }
        return String(data: decodedData, encoding: .utf8)
    }
    
    var base64Encoded: String? {
        let plainData = data(using: .utf8)
        return plainData?.base64EncodedString()
    }
    
}
