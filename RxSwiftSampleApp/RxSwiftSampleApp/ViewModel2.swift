//
//  ViewModel2.swift
//  RxSwiftSampleApp
//
//  Created by Oh!ara on 2022/06/07.
//

import Foundation
import RxCocoa
import RxSwift

protocol ViewModel2 {
    typealias Input = (
        textField: Driver<String>,
        button: Signal<Void>
        )
    
    typealias Output = (
    label: Driver<String>,
        ()
    )
    
    var input: ViewModel2.Input { get }
    var output: ViewModel2.Output { get }
}
