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
	
	func set<T>(key: String, value: T, accessibility: KeychainItemAccessibility? = nil) -> Observable<Void> {
		return Observable<Void>.create({(observer) -> Disposable in
			
			if self.set(key: key, value: T.self, accessibility: accessibility) {
				observer.onCompleted()
			}else {
				observer.onError(NSError())
			}
			return Disposables.create()
		})
	}
	func get<T>(forKey key: String, type: T.Type) -> Observable<T?> {
		return Observable<T?>.create({(observer) -> Disposable in
			
			let value =  self.base.object(forKey: "")
			observer.onNext(value as? T)
			observer.onCompleted()
			
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
