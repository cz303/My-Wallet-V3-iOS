//
//  StellarPaymentOperation.swift
//  Blockchain
//
//  Created by Chris Arriola on 10/25/18.
//  Copyright © 2018 Blockchain Luxembourg S.A. All rights reserved.
//

import Foundation
import StellarKit

enum StellarPaymentOperationError: Int, Error {
    case keyMisMatch
    case cancelled
}

enum StellarMemoType {
    case text(String)
    case identifier(Int)
}

extension StellarMemoType {
    var displayValue: String {
        switch self {
        case .text(let value):
            return value
        case .identifier(let value):
            return String(describing: value)
        }
    }
}

struct StellarPaymentOperation {
    let destinationAccountDisplayName: String
    let destinationAccountId: String
    let amountInXlm: Decimal
    let sourceAccount: StellarWalletAccount
    let feeInXlm: Decimal
    let memo: StellarMemoType?
    
    init(
        destinationAccountDisplayName: String = "",
        destinationAccountId: String,
        amountInXlm: Decimal,
        sourceAccount: StellarWalletAccount,
        feeInXlm: Decimal,
        memo: StellarMemoType? = nil
        ) {
        self.destinationAccountDisplayName = destinationAccountDisplayName
        self.destinationAccountId = destinationAccountId
        self.amountInXlm = amountInXlm
        self.sourceAccount = sourceAccount
        self.feeInXlm = feeInXlm
        self.memo = memo
    }
}
