//
//  Keychain+Rx.swift
//  RxKeychain
//
//  Created by Ahmad Almasri on 5/13/20.
//

import Foundation
import RxSwift

extension KeychainWrapper: ReactiveCompatible {}

public extension Reactive where Base: KeychainWrapper {
	
	func set<T>(key: String, value: T, accessibility: KeychainItemAccessibility? = nil) -> Single<Void> {
		return Single<Void>.create(subscribe: {(observer) -> Disposable in
			
			if self.set(key: key, value: value, accessibility: accessibility) {
				observer(.success(()))
			}else {
                observer(.failure(KeychainError.missingDataType))
			}
			return Disposables.create()
		})
	}
	func get<T>(forKey key: String, type: T.Type, accessibility: KeychainItemAccessibility? = nil) -> Single<T> {
		return Single<T>.create(subscribe: {(observer) -> Disposable in
		
			if let value: T = self.get(key: key, accessibility: accessibility) {
				observer(.success(value))
			}else {
				
				observer(.failure(KeychainError.keyNotFound))
			}
			
			return Disposables.create()
		})
	}
	
	private func get<T>(key: String, accessibility: KeychainItemAccessibility? = nil) -> T? {
		
		switch  T.self {
		case is String.Type:
			return self.base.string(forKey: key, withAccessibility: accessibility) as? T
		case is Bool.Type:
			return self.base.bool(forKey: key, withAccessibility: accessibility) as? T
		case is Data.Type:
			return self.base.data(forKey: key, withAccessibility: accessibility) as? T
		case is Double.Type:
			return self.base.double( forKey: key, withAccessibility: accessibility) as? T
		case is Int.Type:
			return self.base.integer(forKey: key, withAccessibility: accessibility) as? T
		case is Float.Type:
			return self.base.float(forKey: key, withAccessibility: accessibility) as? T
		case is NSCoding.Type:
			return self.base.object(forKey: key, withAccessibility: accessibility) as? T
		default:
			return nil
			
		}
	}
	
	private func set<T>(key: String, value: T, accessibility: KeychainItemAccessibility? = nil) -> Bool {
		
		switch  T.self {
		case is String.Type:
			return self.base.set(value as! String, forKey: key, withAccessibility: accessibility)
		case is Bool.Type:
			return self.base.set(value as! Bool, forKey: key, withAccessibility: accessibility)
		case is Data.Type:
			return self.base.set(value as! Data, forKey: key, withAccessibility: accessibility)
		case is Double.Type:
			return self.base.set(value as! Double, forKey: key, withAccessibility: accessibility)
		case is Int.Type:
			return self.base.set(value as! Int, forKey: key, withAccessibility: accessibility)
		case is Float.Type:
			return self.base.set(value as! Float, forKey: key, withAccessibility: accessibility)
		case is NSCoding.Type:
			return self.base.set(value as! NSCoding, forKey: key, withAccessibility: accessibility)
		default:
			return false
			
		}
	}
	
}
