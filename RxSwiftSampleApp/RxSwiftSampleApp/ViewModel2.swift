//
//  ViewModel2.swift
//  RxSwiftSampleApp
//
//  Created by Oh!ara on 2022/06/07.
//

import Foundation
import RxCocoa
import RxSwift

protocol ViewModel2Input {
    var textField: Driver<String> { get }
    var tap: Signal<Void> { get }
}

protocol ViewModel2Output {
    var label: Observable<String> { get }
    var label2: Driver<String> { get }
}

protocol ViewModel2Type {
    var input: ViewModel2Input { get }
    var output: ViewModel2Output { get }
}


class ViewModel2: ViewModel2Type, ViewModel2Input, ViewModel2Output {
    var textField: Driver<String>
    
    var tap: Signal<Void>
    
    var input: ViewModel2Input { return self }
    var output: ViewModel2Output { return self }
    
    
    // output
    var label: Observable<String>
    var label2: Driver<String>
    
    init(text: Driver<String>, tap: Signal<Void>) {
        
        // input
        textField = text
        self.tap = tap
        
        
        label = self.textField.asObservable().map { text in
            print("text: \(text)")
            return text
        }
        
        label = self.tap.asObservable().map { _ in
            print("tap!!")
            return "tap saretaze ☆"
        }
        
        label2 = textField.map { text in
            print("text2:\(text)")
            return text
        }
        
        label2 = tap.map { _ -> String in
            print("tap!!")
            return "tap saretaze ☆"
        }.asDriver(onErrorDriveWith: .empty())
    }
    
}
