//
//  Observable.swift
//  WhoWantToBeaMillionaire
//
//  Created by Кирилл Тарасов on 05.09.2021.
//

import Foundation


public struct ObservableOptions: OptionSet, CustomStringConvertible {
    public static let initial = ObservableOptions(rawValue: 1 << 0)
    public static let old = ObservableOptions(rawValue: 1 << 1)
    public static let new = ObservableOptions(rawValue: 1 << 2)
    
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public var description: String {
        switch self {
        case .initial:
            return "initial"
        case .old:
            return "old"
        case .new:
            return "new"
        default:
            return "ObservableOptions (rawValue: \(rawValue)"
        }
    }
}

public class Observable<Type> {
    
    fileprivate class Callback {
        fileprivate weak var observer: AnyObject?
        fileprivate let options: [ObservableOptions]
        fileprivate let clousure: (Type, ObservableOptions) -> Void
        
        fileprivate init(observer: AnyObject,
                         options: [ObservableOptions],
                         clousure: @escaping (Type, ObservableOptions) -> Void)
        
        {
            self.observer = observer
            self.options = options
            self.clousure = clousure
        }
    }
    
    public var value: Type {
        didSet {
            removeNilObserverCallbacks()
            notifyCallbacks(value: oldValue, option: .old)
            notifyCallbacks(value: value, option: .new)
        }
    }
    
    public init(_ value: Type) {
        self.value = value
    }
    
    private var callbacks: [Callback] = []
    
    public func addObserver(_ observer: AnyObject,
                            removeIfExists: Bool = true,
                            optoins: [ObservableOptions] = [.new],
                            closure: @escaping (Type, ObservableOptions) -> Void)
    
    {
        if removeIfExists {
            removeObserver(observer)
        }
        
        let callback = Callback(observer: observer, options: optoins, clousure: closure)
        callbacks.append(callback)
        
        if optoins.contains(.initial) {
            closure(value, .initial)
        }
    }
    
    public func removeObserver(_ observer: AnyObject) {
        callbacks = callbacks.filter { $0.observer !== observer }
    }
    
    private func removeNilObserverCallbacks() {
        callbacks = callbacks.filter { $0.observer != nil }
    }
    
    private func notifyCallbacks(value: Type, option: ObservableOptions) {
        let callbacksToNotify = callbacks.filter { $0.options.contains(option) }
        callbacksToNotify.forEach { $0.clousure(value, option) }
    }
    
}
