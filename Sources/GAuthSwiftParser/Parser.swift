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

public enum GAuthSwiftParser {
    
    /** Returns an array of data obtained from google auth link to export accounts. */
    public static func getAccounts(code: String) -> [AccountModel] {
        
        var accounts: [AccountModel] = []
        
        let data = try! GetData(code: code)
        let migratedAccounts = deserialize(code: data.removingPercentEncoding!)
        migratedAccounts.forEach { otpParams in
            let account = AccountModel(
                name: otpParams.name,
                issuer: otpParams.issuer,
                secret: base32Encode(otpParams.secret)
            )
            accounts.append(account)
        }
        return accounts
    }
}
