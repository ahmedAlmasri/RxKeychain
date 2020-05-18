//
//  KeychainError.swift
//  RxKeychain
//
//  Created by Ahmad Almasri on 5/13/20.
//

import Foundation

enum KeychainError: Error, CustomDebugStringConvertible {
	var debugDescription: String {
		switch self {
		case .missingDataType:
			return "Keychain not support your data type supported data types `String, Bool, Data, Double, Int, Float, NSCoding`"
		case .keyNotFound:
			return "key not found in Keychain object or the data type mismatch"
		}
	}
	case missingDataType
	case keyNotFound
}
